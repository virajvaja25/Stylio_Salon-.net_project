using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;

namespace Stylio_Salon
{
    public class Db
    {
        public static string connectionString =
            @"Data Source=(localdb)\ProjectModels;Initial Catalog=stylio_salon_user;Integrated Security=True";

        // ---------------- USERS ----------------
        public static bool RegisterUser(string name, string email, string mobile, string password)
        {
            using (SqlConnection con = new SqlConnection(connectionString))
            {
                string query = "INSERT INTO Users (Name, Email, MobileNumber, Password) " +
                               "VALUES (@name, @email, @mobile, @password)";

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

        public static bool ValidateUser(string email, string password,
                                        out string name, out string mobile)
        {
            name = "";
            mobile = "";

            using (SqlConnection con = new SqlConnection(connectionString))
            {
                string query = "SELECT Name, MobileNumber FROM Users " +
                               "WHERE Email = @email AND Password = @password";

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
                        if (result != null)
                        {
                            return Convert.ToInt32(result);
                        }
                    }
                }

                using (SqlCommand fallbackCmd = new SqlCommand("SELECT TOP 1 UserId FROM Users WHERE ISNULL(Email, '') <> '' ORDER BY UserId", con))
                {
                    object fallback = fallbackCmd.ExecuteScalar();
                    return fallback == null ? 0 : Convert.ToInt32(fallback);
                }
            }
        }

        // ---------------- SALON ----------------
        public static bool AddSalon(string ownerName, string phone, string email,
                                    string description, string address,
                                    string openingHour, string salonName, string salonImage)
        {
            using (SqlConnection con = new SqlConnection(connectionString))
            {
                string query = "INSERT INTO Salon " +
                               "(OwnerName, PhoneNumber, Email, SalonDescription, Address, OpeningHour, SalonImage, SalonName) " +
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
                        if (result != null)
                        {
                            return Convert.ToInt32(result);
                        }
                    }
                }

                using (SqlCommand fallbackCmd = new SqlCommand("SELECT TOP 1 SalonId FROM Salon ORDER BY SalonId", con))
                {
                    object fallback = fallbackCmd.ExecuteScalar();
                    return fallback == null ? 0 : Convert.ToInt32(fallback);
                }
            }
        }

        // ---------------- BOOKING ----------------
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
                    // Seed 2 Upcoming bookings and 2 Past bookings
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

        public static bool CancelBooking(int bookingId, int userId)
        {
            using (SqlConnection con = new SqlConnection(connectionString))
            using (SqlCommand cmd = new SqlCommand(
                "DELETE FROM Booking WHERE BookingId = @id AND UserId = @uid", con))
            {
                cmd.Parameters.AddWithValue("@id", bookingId);
                cmd.Parameters.AddWithValue("@uid", userId);
                con.Open();
                return cmd.ExecuteNonQuery() > 0;
            }
        }

        // Call this when a booking is confirmed
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
    }
}