using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;
using System.Linq;
using System.Web;

namespace Stylio_Salon
{
    public class Db
    {
        private static string _connectionString;

        public static string connectionString
        {
            get
            {
                if (!string.IsNullOrEmpty(_connectionString))
                    return _connectionString;

                EnsureDataDirectory();

                // 1. Direct MSSQLLocalDB with |DataDirectory|\Database1.mdf (Primary App_Data database)
                string appDataConn = @"Data Source=(LocalDB)\MSSQLLocalDB;AttachDbFilename=|DataDirectory|\Database1.mdf;Integrated Security=True;Connect Timeout=30";
                if (TestConnection(appDataConn))
                {
                    _connectionString = appDataConn;
                    return _connectionString;
                }

                // 2. Try connection string from Web.config if present
                if (ConfigurationManager.ConnectionStrings["StylioConnectionString"] != null)
                {
                    string webConfigConn = ConfigurationManager.ConnectionStrings["StylioConnectionString"].ConnectionString;
                    if (!string.IsNullOrEmpty(webConfigConn) && TestConnection(webConfigConn))
                    {
                        _connectionString = webConfigConn;
                        return _connectionString;
                    }
                }

                // 3. Fallback to ProjectModels stylio_salon_user
                string projectModelsConn = @"Data Source=(localdb)\ProjectModels;Initial Catalog=stylio_salon_user;Integrated Security=True";
                if (TestConnection(projectModelsConn))
                {
                    _connectionString = projectModelsConn;
                    return _connectionString;
                }

                _connectionString = appDataConn;
                return _connectionString;
            }
            set
            {
                _connectionString = value;
            }
        }

        private static void EnsureDataDirectory()
        {
            if (AppDomain.CurrentDomain.GetData("DataDirectory") == null)
            {
                string path = null;
                try
                {
                    path = HttpRuntime.AppDomainAppPath;
                }
                catch { }

                if (string.IsNullOrEmpty(path))
                {
                    path = AppDomain.CurrentDomain.BaseDirectory;
                }

                string appData = System.IO.Path.Combine(path, "App_Data");
                if (!System.IO.Directory.Exists(appData))
                {
                    string current = Environment.CurrentDirectory;
                    string candidate = System.IO.Path.Combine(current, "App_Data");
                    if (System.IO.Directory.Exists(candidate))
                    {
                        appData = candidate;
                    }
                    else
                    {
                        string parent = System.IO.Path.GetDirectoryName(path.TrimEnd('\\', '/'));
                        if (!string.IsNullOrEmpty(parent))
                        {
                            string parentCandidate = System.IO.Path.Combine(parent, "App_Data");
                            if (System.IO.Directory.Exists(parentCandidate))
                            {
                                appData = parentCandidate;
                            }
                        }
                    }
                }

                if (System.IO.Directory.Exists(appData))
                {
                    AppDomain.CurrentDomain.SetData("DataDirectory", appData);
                }
            }
        }

        private static bool TestConnection(string connStr)
        {
            try
            {
                using (SqlConnection testCon = new SqlConnection(connStr))
                {
                    testCon.Open();
                    return true;
                }
            }
            catch
            {
                return false;
            }
        }

        // ======================== USERS ========================

        public static bool RegisterUser(string name, string email, string mobile, string password)
        {
            using (SqlConnection con = new SqlConnection(connectionString))
            {
                string query = "INSERT INTO Users (Name, Email, MobileNumber, Password) VALUES (@name, @email, @mobile, @password)";
                using (SqlCommand cmd = new SqlCommand(query, con))
                {
                    cmd.Parameters.AddWithValue("@name", name);
                    cmd.Parameters.AddWithValue("@email", email);
                    cmd.Parameters.AddWithValue("@mobile", mobile);
                    cmd.Parameters.AddWithValue("@password", password);
                    con.Open();
                    return cmd.ExecuteNonQuery() > 0;
                }
            }
        }

        public static bool EmailExists(string email)
        {
            using (SqlConnection con = new SqlConnection(connectionString))
            using (SqlCommand cmd = new SqlCommand("SELECT COUNT(*) FROM Users WHERE Email = @email", con))
            {
                cmd.Parameters.AddWithValue("@email", email);
                con.Open();
                return Convert.ToInt32(cmd.ExecuteScalar()) > 0;
            }
        }

        public static bool ValidateUser(string email, string password, out string name, out string mobile)
        {
            name = "";
            mobile = "";
            using (SqlConnection con = new SqlConnection(connectionString))
            {
                string query = "SELECT Name, MobileNumber FROM Users WHERE Email = @email AND Password = @password";
                using (SqlCommand cmd = new SqlCommand(query, con))
                {
                    cmd.Parameters.AddWithValue("@email", email);
                    cmd.Parameters.AddWithValue("@password", password);
                    con.Open();
                    using (SqlDataReader dr = cmd.ExecuteReader())
                    {
                        if (dr.Read())
                        {
                            name = dr["Name"].ToString();
                            mobile = dr["MobileNumber"].ToString();
                            return true;
                        }
                    }
                }
            }
            return false;
        }

        public static int GetUserId(string email)
        {
            using (SqlConnection con = new SqlConnection(connectionString))
            {
                con.Open();
                if (!string.IsNullOrEmpty(email))
                {
                    using (SqlCommand cmd = new SqlCommand("SELECT TOP 1 UserId FROM Users WHERE Email = @email", con))
                    {
                        cmd.Parameters.AddWithValue("@email", email);
                        object result = cmd.ExecuteScalar();
                        if (result != null) return Convert.ToInt32(result);
                    }
                }
                using (SqlCommand fallbackCmd = new SqlCommand("SELECT TOP 1 UserId FROM Users WHERE ISNULL(Email, '') <> '' ORDER BY UserId", con))
                {
                    object fallback = fallbackCmd.ExecuteScalar();
                    return fallback == null ? 0 : Convert.ToInt32(fallback);
                }
            }
        }

        public static DataRow GetUserByEmail(string email)
        {
            using (SqlConnection con = new SqlConnection(connectionString))
            {
                string query = "SELECT UserId, Name, Email, MobileNumber FROM Users WHERE Email = @email";
                using (SqlCommand cmd = new SqlCommand(query, con))
                {
                    cmd.Parameters.AddWithValue("@email", email);
                    con.Open();
                    DataTable dt = new DataTable();
                    new SqlDataAdapter(cmd).Fill(dt);
                    return dt.Rows.Count > 0 ? dt.Rows[0] : null;
                }
            }
        }

        public static bool UpdateUser(int userId, string name, string mobile)
        {
            using (SqlConnection con = new SqlConnection(connectionString))
            using (SqlCommand cmd = new SqlCommand("UPDATE Users SET Name=@name, MobileNumber=@mobile WHERE UserId=@uid", con))
            {
                cmd.Parameters.AddWithValue("@name", name);
                cmd.Parameters.AddWithValue("@mobile", mobile);
                cmd.Parameters.AddWithValue("@uid", userId);
                con.Open();
                return cmd.ExecuteNonQuery() > 0;
            }
        }

        public static bool ChangePassword(int userId, string oldPassword, string newPassword)
        {
            using (SqlConnection con = new SqlConnection(connectionString))
            {
                // Verify old password first
                using (SqlCommand checkCmd = new SqlCommand("SELECT COUNT(*) FROM Users WHERE UserId=@uid AND Password=@old", con))
                {
                    checkCmd.Parameters.AddWithValue("@uid", userId);
                    checkCmd.Parameters.AddWithValue("@old", oldPassword);
                    con.Open();
                    if (Convert.ToInt32(checkCmd.ExecuteScalar()) == 0) return false;
                }
                using (SqlCommand updateCmd = new SqlCommand("UPDATE Users SET Password=@new WHERE UserId=@uid", con))
                {
                    updateCmd.Parameters.AddWithValue("@new", newPassword);
                    updateCmd.Parameters.AddWithValue("@uid", userId);
                    return updateCmd.ExecuteNonQuery() > 0;
                }
            }
        }

        public static bool ResetPasswordByEmail(string email, string newPassword)
        {
            using (SqlConnection con = new SqlConnection(connectionString))
            using (SqlCommand cmd = new SqlCommand("UPDATE Users SET Password = @pwd WHERE Email = @email", con))
            {
                cmd.Parameters.AddWithValue("@pwd", newPassword);
                cmd.Parameters.AddWithValue("@email", email);
                con.Open();
                return cmd.ExecuteNonQuery() > 0;
            }
        }

        // Admin: Get all users
        public static DataTable GetAllUsers()
        {
            DataTable dt = new DataTable();
            using (SqlConnection con = new SqlConnection(connectionString))
            using (SqlDataAdapter da = new SqlDataAdapter("SELECT UserId, Name, Email, MobileNumber FROM Users WHERE Email <> 'admin@stylio.com' ORDER BY UserId", con))
            {
                da.Fill(dt);
            }
            return dt;
        }

        public static int GetTotalUsers()
        {
            using (SqlConnection con = new SqlConnection(connectionString))
            using (SqlCommand cmd = new SqlCommand("SELECT COUNT(*) FROM Users WHERE Email <> 'admin@stylio.com'", con))
            {
                con.Open();
                return Convert.ToInt32(cmd.ExecuteScalar());
            }
        }

        public static bool DeleteUser(int userId)
        {
            using (SqlConnection con = new SqlConnection(connectionString))
            {
                con.Open();
                // Delete user's bookings first (FK constraint)
                using (SqlCommand delBookings = new SqlCommand("DELETE FROM Booking WHERE UserId=@uid", con))
                {
                    delBookings.Parameters.AddWithValue("@uid", userId);
                    delBookings.ExecuteNonQuery();
                }
                using (SqlCommand delUser = new SqlCommand("DELETE FROM Users WHERE UserId=@uid", con))
                {
                    delUser.Parameters.AddWithValue("@uid", userId);
                    return delUser.ExecuteNonQuery() > 0;
                }
            }
        }

        // ======================== SALON ========================

        public static bool AddSalon(string ownerName, string phone, string email,
                                    string description, string address,
                                    string openingHour, string salonName, string salonImage)
        {
            using (SqlConnection con = new SqlConnection(connectionString))
            {
                string query = "INSERT INTO Salon (OwnerName, PhoneNumber, Email, SalonDescription, Address, OpeningHour, SalonImage, SalonName) " +
                               "VALUES (@owner, @phone, @email, @desc, @address, @hour, @image, @salonName)";
                using (SqlCommand cmd = new SqlCommand(query, con))
                {
                    cmd.Parameters.AddWithValue("@owner", ownerName);
                    cmd.Parameters.AddWithValue("@phone", phone);
                    cmd.Parameters.AddWithValue("@email", email);
                    cmd.Parameters.AddWithValue("@desc", string.IsNullOrEmpty(description) ? (object)DBNull.Value : description);
                    cmd.Parameters.AddWithValue("@address", address);
                    cmd.Parameters.AddWithValue("@hour", string.IsNullOrEmpty(openingHour) ? (object)DBNull.Value : openingHour);
                    cmd.Parameters.AddWithValue("@image", string.IsNullOrEmpty(salonImage) ? (object)DBNull.Value : salonImage);
                    cmd.Parameters.AddWithValue("@salonName", salonName);
                    con.Open();
                    return cmd.ExecuteNonQuery() > 0;
                }
            }
        }

        public static DataTable GetAllSalons()
        {
            DataTable dt = new DataTable();
            using (SqlConnection con = new SqlConnection(connectionString))
            using (SqlDataAdapter da = new SqlDataAdapter("SELECT SalonId, SalonName, OwnerName, PhoneNumber, Email, Address, OpeningHour, SalonImage, SalonDescription FROM Salon ORDER BY SalonId", con))
            {
                da.Fill(dt);
            }
            return dt;
        }

        public static DataRow GetSalonById(int salonId)
        {
            DataTable dt = new DataTable();
            using (SqlConnection con = new SqlConnection(connectionString))
            using (SqlCommand cmd = new SqlCommand("SELECT * FROM Salon WHERE SalonId = @id", con))
            {
                cmd.Parameters.AddWithValue("@id", salonId);
                con.Open();
                new SqlDataAdapter(cmd).Fill(dt);
            }
            return dt.Rows.Count > 0 ? dt.Rows[0] : null;
        }

        public static int GetSalonIdByName(string salonName)
        {
            using (SqlConnection con = new SqlConnection(connectionString))
            {
                con.Open();
                if (!string.IsNullOrEmpty(salonName))
                {
                    using (SqlCommand cmd = new SqlCommand(
                        "SELECT TOP 1 SalonId FROM Salon WHERE SalonName = @name OR SalonName LIKE '%' + @name + '%' OR @name LIKE '%' + SalonName + '%'", con))
                    {
                        cmd.Parameters.AddWithValue("@name", salonName);
                        object result = cmd.ExecuteScalar();
                        if (result != null) return Convert.ToInt32(result);
                    }
                }
                using (SqlCommand fallbackCmd = new SqlCommand("SELECT TOP 1 SalonId FROM Salon ORDER BY SalonId", con))
                {
                    object fallback = fallbackCmd.ExecuteScalar();
                    return fallback == null ? 0 : Convert.ToInt32(fallback);
                }
            }
        }

        public static int GetTotalSalons()
        {
            using (SqlConnection con = new SqlConnection(connectionString))
            using (SqlCommand cmd = new SqlCommand("SELECT COUNT(*) FROM Salon", con))
            {
                con.Open();
                return Convert.ToInt32(cmd.ExecuteScalar());
            }
        }

        public static bool DeleteSalon(int salonId)
        {
            using (SqlConnection con = new SqlConnection(connectionString))
            {
                con.Open();
                using (SqlCommand delBookings = new SqlCommand("DELETE FROM Booking WHERE SalonId=@sid", con))
                {
                    delBookings.Parameters.AddWithValue("@sid", salonId);
                    delBookings.ExecuteNonQuery();
                }
                using (SqlCommand delSalon = new SqlCommand("DELETE FROM Salon WHERE SalonId=@sid", con))
                {
                    delSalon.Parameters.AddWithValue("@sid", salonId);
                    return delSalon.ExecuteNonQuery() > 0;
                }
            }
        }

        public static DataTable SearchSalons(string keyword)
        {
            DataTable dt = new DataTable();
            using (SqlConnection con = new SqlConnection(connectionString))
            {
                string query = "SELECT SalonId, SalonName, OwnerName, PhoneNumber, Email, Address, OpeningHour, SalonImage, SalonDescription FROM Salon " +
                               "WHERE SalonName LIKE @kw OR Address LIKE @kw OR OwnerName LIKE @kw OR SalonDescription LIKE @kw ORDER BY SalonId";
                using (SqlCommand cmd = new SqlCommand(query, con))
                {
                    cmd.Parameters.AddWithValue("@kw", "%" + keyword + "%");
                    con.Open();
                    new SqlDataAdapter(cmd).Fill(dt);
                }
            }
            return dt;
        }

        // ======================== BOOKING ========================

        public static void EnsureDefaultBookings(int userId)
        {
            if (userId <= 0) return;
            using (SqlConnection con = new SqlConnection(connectionString))
            {
                con.Open();
                using (SqlCommand checkCmd = new SqlCommand("SELECT COUNT(*) FROM Booking WHERE UserId = @uid", con))
                {
                    checkCmd.Parameters.AddWithValue("@uid", userId);
                    int count = Convert.ToInt32(checkCmd.ExecuteScalar());
                    if (count > 0) return;
                }
                int salon1 = GetSalonIdByName("Stylio Men's Salon");
                int salon2 = GetSalonIdByName("The Mae Mane Salon");
                if (salon2 == 0) salon2 = salon1;
                if (salon1 > 0)
                {
                    AddBooking(userId, salon1, "Hair Cut", DateTime.Today.AddDays(5), new TimeSpan(16, 30, 0), 176m);
                    AddBooking(userId, salon2, "Beard Styling", DateTime.Today.AddDays(8), new TimeSpan(11, 30, 0), 117m);
                    AddBooking(userId, salon1, "Hair Cut", DateTime.Today.AddDays(-10), new TimeSpan(16, 30, 0), 176m);
                    AddBooking(userId, salon2, "Beard Styling", DateTime.Today.AddDays(-20), new TimeSpan(11, 30, 0), 117m);
                }
            }
        }

        public static DataTable GetBookingsByUser(int userId, bool upcoming)
        {
            EnsureDefaultBookings(userId);
            string condition = upcoming
                ? "(b.BookingDate > @today OR (b.BookingDate = @today AND b.BookingTime >= @now)) ORDER BY b.BookingDate, b.BookingTime"
                : "(b.BookingDate < @today OR (b.BookingDate = @today AND b.BookingTime < @now)) ORDER BY b.BookingDate DESC, b.BookingTime DESC";
            string query = "SELECT b.BookingId, b.Services, b.BookingDate, b.BookingTime, b.TotalAmount, " +
                           "s.SalonName, s.SalonImage " +
                           "FROM Booking b INNER JOIN Salon s ON b.SalonId = s.SalonId " +
                           "WHERE b.UserId = @uid AND " + condition;
            DataTable dt = new DataTable();
            using (SqlConnection con = new SqlConnection(connectionString))
            using (SqlDataAdapter da = new SqlDataAdapter(query, con))
            {
                da.SelectCommand.Parameters.AddWithValue("@uid", userId);
                da.SelectCommand.Parameters.Add("@today", SqlDbType.Date).Value = DateTime.Today;
                da.SelectCommand.Parameters.Add("@now", SqlDbType.Time).Value = DateTime.Now.TimeOfDay;
                da.Fill(dt);
            }
            return dt;
        }

        // Admin: All bookings with user and salon info
        public static DataTable GetAllBookings()
        {
            DataTable dt = new DataTable();
            string query = "SELECT b.BookingId, u.Name AS CustomerName, u.Email AS CustomerEmail, " +
                           "b.Services, b.BookingDate, b.BookingTime, b.TotalAmount, s.SalonName, " +
                           "CASE WHEN b.BookingDate > CAST(GETDATE() AS DATE) THEN 'Upcoming' " +
                           "WHEN b.BookingDate < CAST(GETDATE() AS DATE) THEN 'Completed' " +
                           "ELSE CASE WHEN b.BookingTime > CAST(GETDATE() AS TIME) THEN 'Upcoming' ELSE 'Completed' END END AS Status " +
                           "FROM Booking b " +
                           "INNER JOIN Users u ON b.UserId = u.UserId " +
                           "INNER JOIN Salon s ON b.SalonId = s.SalonId " +
                           "ORDER BY b.BookingDate DESC, b.BookingTime DESC";
            using (SqlConnection con = new SqlConnection(connectionString))
            using (SqlDataAdapter da = new SqlDataAdapter(query, con))
            {
                da.Fill(dt);
            }
            return dt;
        }

        public static DataTable GetAllBookingsFiltered(string statusFilter)
        {
            DataTable dt = new DataTable();
            string query = "SELECT b.BookingId, u.Name AS CustomerName, u.Email AS CustomerEmail, " +
                           "b.Services, b.BookingDate, b.BookingTime, b.TotalAmount, s.SalonName, " +
                           "CASE WHEN b.BookingDate > CAST(GETDATE() AS DATE) THEN 'Upcoming' " +
                           "WHEN b.BookingDate < CAST(GETDATE() AS DATE) THEN 'Completed' " +
                           "ELSE CASE WHEN b.BookingTime > CAST(GETDATE() AS TIME) THEN 'Upcoming' ELSE 'Completed' END END AS Status " +
                           "FROM Booking b " +
                           "INNER JOIN Users u ON b.UserId = u.UserId " +
                           "INNER JOIN Salon s ON b.SalonId = s.SalonId " +
                           "ORDER BY b.BookingDate DESC, b.BookingTime DESC";
            using (SqlConnection con = new SqlConnection(connectionString))
            using (SqlDataAdapter da = new SqlDataAdapter(query, con))
            {
                da.Fill(dt);
            }
            // Filter in memory since HAVING on computed columns is complex
            if (statusFilter == "Upcoming" || statusFilter == "Completed")
            {
                DataRow[] filtered = dt.Select("Status = '" + statusFilter + "'");
                DataTable filteredDt = dt.Clone();
                foreach (DataRow row in filtered) filteredDt.ImportRow(row);
                return filteredDt;
            }
            return dt;
        }

        public static int GetTotalBookings()
        {
            using (SqlConnection con = new SqlConnection(connectionString))
            using (SqlCommand cmd = new SqlCommand("SELECT COUNT(*) FROM Booking", con))
            {
                con.Open();
                return Convert.ToInt32(cmd.ExecuteScalar());
            }
        }

        public static decimal GetTotalRevenue()
        {
            using (SqlConnection con = new SqlConnection(connectionString))
            using (SqlCommand cmd = new SqlCommand("SELECT ISNULL(SUM(TotalAmount), 0) FROM Booking", con))
            {
                con.Open();
                return Convert.ToDecimal(cmd.ExecuteScalar());
            }
        }

        public static bool CancelBooking(int bookingId, int userId)
        {
            using (SqlConnection con = new SqlConnection(connectionString))
            using (SqlCommand cmd = new SqlCommand("DELETE FROM Booking WHERE BookingId = @id AND UserId = @uid", con))
            {
                cmd.Parameters.AddWithValue("@id", bookingId);
                cmd.Parameters.AddWithValue("@uid", userId);
                con.Open();
                return cmd.ExecuteNonQuery() > 0;
            }
        }

        public static int AddBooking(int userId, int salonId, string services,
                                     DateTime date, TimeSpan time, decimal totalAmount)
        {
            using (SqlConnection con = new SqlConnection(connectionString))
            using (SqlCommand cmd = new SqlCommand(
                "INSERT INTO Booking (UserId, SalonId, Services, BookingDate, BookingTime, TotalAmount) " +
                "OUTPUT INSERTED.BookingId " +
                "VALUES (@uid, @sid, @services, @date, @time, @total)", con))
            {
                cmd.Parameters.AddWithValue("@uid", userId);
                cmd.Parameters.AddWithValue("@sid", salonId);
                cmd.Parameters.AddWithValue("@services", services);
                cmd.Parameters.Add("@date", SqlDbType.Date).Value = date.Date;
                cmd.Parameters.Add("@time", SqlDbType.Time).Value = time;
                cmd.Parameters.AddWithValue("@total", totalAmount);
                con.Open();
                return Convert.ToInt32(cmd.ExecuteScalar());
            }
        }

        // ======================== ADMIN AUTH ========================

        public static bool ValidateAdmin(string email, string password)
        {
            // Check Users table for admin account
            using (SqlConnection con = new SqlConnection(connectionString))
            using (SqlCommand cmd = new SqlCommand(
                "SELECT COUNT(*) FROM Users WHERE Email = @email AND Password = @password AND Email = 'admin@stylio.com'", con))
            {
                cmd.Parameters.AddWithValue("@email", email);
                cmd.Parameters.AddWithValue("@password", password);
                con.Open();
                return Convert.ToInt32(cmd.ExecuteScalar()) > 0;
            }
        }

        public static string GetAdminName(string email)
        {
            using (SqlConnection con = new SqlConnection(connectionString))
            using (SqlCommand cmd = new SqlCommand("SELECT TOP 1 Name FROM Users WHERE Email = @email", con))
            {
                cmd.Parameters.AddWithValue("@email", email);
                con.Open();
                object result = cmd.ExecuteScalar();
                return result != null ? result.ToString() : "Admin";
            }
        }

        // Admin: Search users by name/email
        public static DataTable SearchUsers(string keyword)
        {
            DataTable dt = new DataTable();
            using (SqlConnection con = new SqlConnection(connectionString))
            {
                string query = "SELECT UserId, Name, Email, MobileNumber FROM Users " +
                               "WHERE Email <> 'admin@stylio.com' AND " +
                               "(Name LIKE @kw OR Email LIKE @kw OR MobileNumber LIKE @kw) ORDER BY UserId";
                using (SqlCommand cmd = new SqlCommand(query, con))
                {
                    cmd.Parameters.AddWithValue("@kw", "%" + keyword + "%");
                    con.Open();
                    new SqlDataAdapter(cmd).Fill(dt);
                }
            }
            return dt;
        }

        // ======================== IMAGE RESOLUTION HELPER ========================

        /// <summary>
        /// Resolves a database SalonImage string into an application-relative URL (e.g. ~/Images/salon_stylio.png)
        /// cleanly preventing double-prefixing (~/Images/~/Images/...) and providing a safe, verified fallback.
        /// </summary>
        public static string ResolveSalonImage(object dbValue, string fallback = "~/Images/salon_stylio.png")
        {
            if (dbValue == null || dbValue == DBNull.Value)
                return fallback;

            string val = dbValue.ToString().Trim();
            if (string.IsNullOrEmpty(val))
                return fallback;

            // Fix any repeated prefixes like ~/Images/~/Images/...
            while (val.IndexOf("~/Images/~/", StringComparison.OrdinalIgnoreCase) >= 0)
            {
                val = val.Replace("~/Images/~/", "~/");
            }

            // Remap old service image seed values if used as salon image
            if (val.IndexOf("haircut_booking.jpg", StringComparison.OrdinalIgnoreCase) >= 0)
                return "~/Images/salon_stylio.png";
            if (val.IndexOf("beard_booking.jpg", StringComparison.OrdinalIgnoreCase) >= 0)
                return "~/Images/salon_maemane.png";

            if (val.StartsWith("~/"))
                return val;

            if (val.StartsWith("/"))
                return "~" + val;

            if (val.StartsWith("Images/", StringComparison.OrdinalIgnoreCase))
                return "~/" + val;

            return "~/Images/" + val;
        }

        // ======================== GENERIC COLLECTIONS HELPERS ========================

        /// <summary>
        /// Returns all salons as a strongly-typed generic List<Salon> collection.
        /// </summary>
        public static List<Salon> GetSalonsList()
        {
            var list = new List<Salon>();
            DataTable dt = GetAllSalons();
            foreach (DataRow row in dt.Rows)
            {
                list.Add(new Salon
                {
                    Id = Convert.ToInt32(row["SalonId"]),
                    Name = row["SalonName"].ToString(),
                    Rating = "4.8",
                    Location = row["Address"].ToString(),
                    ImageUrl = ResolveSalonImage(row["SalonImage"])
                });
            }
            return list;
        }

        /// <summary>
        /// Returns all salons mapped into a Dictionary<int, Salon> collection for O(1) instant lookup by SalonId.
        /// </summary>
        public static Dictionary<int, Salon> GetSalonsDictionary()
        {
            var dict = new Dictionary<int, Salon>();
            List<Salon> salons = GetSalonsList();
            foreach (var salon in salons)
            {
                if (!dict.ContainsKey(salon.Id))
                {
                    dict.Add(salon.Id, salon);
                }
            }
            return dict;
        }

        /// <summary>
        /// Returns a user's bookings as a generic List<BookingRecord> collection.
        /// </summary>
        public static List<BookingRecord> GetUserBookingsList(int userId, bool upcoming)
        {
            var list = new List<BookingRecord>();
            DataTable dt = GetBookingsByUser(userId, upcoming);
            foreach (DataRow row in dt.Rows)
            {
                TimeSpan tSpan = TimeSpan.Zero;
                if (row["BookingTime"] is TimeSpan)
                {
                    tSpan = (TimeSpan)row["BookingTime"];
                }
                else if (row["BookingTime"] != DBNull.Value)
                {
                    TimeSpan.TryParse(row["BookingTime"].ToString(), out tSpan);
                }

                list.Add(new BookingRecord
                {
                    BookingId = Convert.ToInt32(row["BookingId"]),
                    UserId = userId,
                    SalonName = row["SalonName"].ToString(),
                    SalonImage = ResolveSalonImage(row["SalonImage"]),
                    Services = row["Services"].ToString(),
                    BookingDate = Convert.ToDateTime(row["BookingDate"]),
                    BookingTime = tSpan,
                    TotalAmount = Convert.ToDecimal(row["TotalAmount"])
                });
            }
            return list;
        }

        /// <summary>
        /// Returns all registered users as a generic List<UserRecord> collection.
        /// </summary>
        public static List<UserRecord> GetUsersList()
        {
            var list = new List<UserRecord>();
            DataTable dt = GetAllUsers();
            foreach (DataRow row in dt.Rows)
            {
                list.Add(new UserRecord
                {
                    UserId = Convert.ToInt32(row["UserId"]),
                    Name = row["Name"].ToString(),
                    Email = row["Email"].ToString(),
                    MobileNumber = row["MobileNumber"] != DBNull.Value ? row["MobileNumber"].ToString() : "",
                    Role = row["Email"].ToString().Equals("admin@stylio.com", StringComparison.OrdinalIgnoreCase) ? "Admin" : "Customer"
                });
            }
            return list;
        }

        /// <summary>
        /// Returns default service catalog items as a generic List<ServiceCatalogItem> collection.
        /// </summary>
        public static List<ServiceCatalogItem> GetServiceCatalogList()
        {
            return new List<ServiceCatalogItem>
            {
                new ServiceCatalogItem { Name = "Classic Haircut & Styling", Category = "Hair", Description = "Precision cut customized to your face structure.", Duration = "30-45 mins", PriceRange = "₹149", IconUrl = "~/Images/DefaultScreen/icon-haircut.png" },
                new ServiceCatalogItem { Name = "Beard Trim & Precision Shape", Category = "Beard", Description = "Expert beard shaping, razor lining and beard oil.", Duration = "20-30 mins", PriceRange = "₹99", IconUrl = "~/Images/DefaultScreen/icon-beard.png" },
                new ServiceCatalogItem { Name = "Global Hair Color & Streaks", Category = "Color", Description = "Ammonia-free vibrant hair coloring.", Duration = "60-90 mins", PriceRange = "₹299", IconUrl = "~/Images/DefaultScreen/icon-haircolor.png" },
                new ServiceCatalogItem { Name = "Deep Cleansing Facial", Category = "Skin", Description = "Exfoliating scrub, steam, and face pack.", Duration = "45-60 mins", PriceRange = "₹500", IconUrl = "~/Images/DefaultScreen/icon-facial.png" },
                new ServiceCatalogItem { Name = "Intense Hair Spa & Repair", Category = "Hair", Description = "Deep conditioning mask and scalp massage.", Duration = "45 mins", PriceRange = "₹399", IconUrl = "~/Images/DefaultScreen/icon-haircut.png" },
                new ServiceCatalogItem { Name = "D-Tan & Skin Brightening", Category = "Skin", Description = "Instant glow therapy to remove UV tan.", Duration = "30 mins", PriceRange = "₹300", IconUrl = "~/Images/DefaultScreen/icon-facial.png" }
            };
        }
    }
}