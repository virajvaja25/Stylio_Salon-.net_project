-- =============================================
-- Stylio Salon - Database Schema & Setup Script
-- Tables: Users, Salon, Booking
-- =============================================

IF NOT EXISTS (SELECT * FROM sys.tables WHERE name = 'Users')
BEGIN
    CREATE TABLE [dbo].[Users] (
        [UserId]       INT            IDENTITY (1, 1) NOT NULL,
        [Name]         NVARCHAR (200) NOT NULL,
        [Email]        NVARCHAR (200) NOT NULL,
        [MobileNumber] NVARCHAR (50)  NULL,
        [Password]     NVARCHAR (200) NOT NULL,
        CONSTRAINT [PK_Users] PRIMARY KEY CLUSTERED ([UserId] ASC)
    );
END
GO

IF NOT EXISTS (SELECT * FROM sys.tables WHERE name = 'Salon')
BEGIN
    CREATE TABLE [dbo].[Salon] (
        [SalonId]          INT            IDENTITY (1, 1) NOT NULL,
        [OwnerName]        NVARCHAR (200) NULL,
        [PhoneNumber]      NVARCHAR (50)  NULL,
        [Email]            NVARCHAR (200) NULL,
        [SalonDescription] NVARCHAR (MAX) NULL,
        [Address]          NVARCHAR (500) NULL,
        [OpeningHour]      NVARCHAR (200) NULL,
        [SalonImage]       NVARCHAR (500) NULL,
        [SalonName]        NVARCHAR (200) NOT NULL,
        CONSTRAINT [PK_Salon] PRIMARY KEY CLUSTERED ([SalonId] ASC)
    );
END
GO

IF NOT EXISTS (SELECT * FROM sys.tables WHERE name = 'Booking')
BEGIN
    CREATE TABLE [dbo].[Booking] (
        [BookingId]   INT             IDENTITY (1, 1) NOT NULL,
        [UserId]      INT             NOT NULL,
        [SalonId]     INT             NOT NULL,
        [Services]    NVARCHAR (500)  NOT NULL,
        [BookingDate] DATE            NOT NULL,
        [BookingTime] TIME (7)        NOT NULL,
        [TotalAmount] DECIMAL (18, 2) NOT NULL,
        CONSTRAINT [PK_Booking] PRIMARY KEY CLUSTERED ([BookingId] ASC),
        CONSTRAINT [FK_Booking_Users] FOREIGN KEY ([UserId]) REFERENCES [dbo].[Users] ([UserId]),
        CONSTRAINT [FK_Booking_Salon] FOREIGN KEY ([SalonId]) REFERENCES [dbo].[Salon] ([SalonId])
    );
END
GO

-- Seed Default Users
SET IDENTITY_INSERT [dbo].[Users] ON;
IF NOT EXISTS (SELECT 1 FROM [dbo].[Users] WHERE [Email] = 'admin@stylio.com')
    INSERT INTO [dbo].[Users] ([UserId], [Name], [Email], [MobileNumber], [Password]) VALUES (2, 'Stylio Admin', 'admin@stylio.com', '9876543210', 'admin123');
IF NOT EXISTS (SELECT 1 FROM [dbo].[Users] WHERE [Email] = 'viraj@gmail.com')
    INSERT INTO [dbo].[Users] ([UserId], [Name], [Email], [MobileNumber], [Password]) VALUES (1, 'Viraj Vaja', 'viraj@gmail.com', '9876543210', '123456');
IF NOT EXISTS (SELECT 1 FROM [dbo].[Users] WHERE [Email] = 'virajvaja82@gmail.com')
    INSERT INTO [dbo].[Users] ([UserId], [Name], [Email], [MobileNumber], [Password]) VALUES (4, 'Viraj Vaja', 'virajvaja82@gmail.com', '9876543210', '123456');
IF NOT EXISTS (SELECT 1 FROM [dbo].[Users] WHERE [Email] = 'virajvaja2@gmail.com')
    INSERT INTO [dbo].[Users] ([UserId], [Name], [Email], [MobileNumber], [Password]) VALUES (7, 'Viraj Vaja', 'virajvaja2@gmail.com', '9724020200', 'viraj12');
SET IDENTITY_INSERT [dbo].[Users] OFF;
GO

-- Seed Default Salons
SET IDENTITY_INSERT [dbo].[Salon] ON;
IF NOT EXISTS (SELECT 1 FROM [dbo].[Salon] WHERE [SalonId] = 1)
    INSERT INTO [dbo].[Salon] ([SalonId], [OwnerName], [PhoneNumber], [Email], [SalonDescription], [Address], [OpeningHour], [SalonImage], [SalonName])
    VALUES (1, 'Rajesh Sharma', '+91 98765 43210', 'stylio@gmail.com', 'Premium grooming and hair care salon.', 'Rajkot, Gujarat', '09:00 AM - 09:00 PM', 'salon_stylio.png', 'Stylio Men''s Salon');
IF NOT EXISTS (SELECT 1 FROM [dbo].[Salon] WHERE [SalonId] = 2)
    INSERT INTO [dbo].[Salon] ([SalonId], [OwnerName], [PhoneNumber], [Email], [SalonDescription], [Address], [OpeningHour], [SalonImage], [SalonName])
    VALUES (2, 'Priya Patel', '+91 98765 43211', 'maemane@gmail.com', 'Luxury unisex hair and beauty lounge.', 'Ahmedabad, Gujarat', '10:00 AM - 08:00 PM', 'salon_maemane.png', 'The Mae Mane Salon');
IF NOT EXISTS (SELECT 1 FROM [dbo].[Salon] WHERE [SalonId] = 3)
    INSERT INTO [dbo].[Salon] ([SalonId], [OwnerName], [PhoneNumber], [Email], [SalonDescription], [Address], [OpeningHour], [SalonImage], [SalonName])
    VALUES (3, 'Amit Verma', '+91 98765 43212', 'hairstudio@gmail.com', 'Modern styling and trend haircuts.', 'Surat, Gujarat', '09:30 AM - 09:00 PM', 'salon_hairstudio.png', 'The Hair Studio');
SET IDENTITY_INSERT [dbo].[Salon] OFF;
GO

-- Seed Sample Bookings (Upcoming and Past)
IF NOT EXISTS (SELECT 1 FROM [dbo].[Booking])
BEGIN
    INSERT INTO [dbo].[Booking] ([UserId], [SalonId], [Services], [BookingDate], [BookingTime], [TotalAmount])
    VALUES 
        (1, 1, 'Hair Cut', DATEADD(day, 5, CAST(GETDATE() AS DATE)), '16:30:00', 176.00),
        (1, 2, 'Beard Styling', DATEADD(day, 8, CAST(GETDATE() AS DATE)), '11:30:00', 117.00),
        (1, 1, 'Hair Cut', DATEADD(day, -10, CAST(GETDATE() AS DATE)), '16:30:00', 176.00),
        (1, 2, 'Beard Styling', DATEADD(day, -20, CAST(GETDATE() AS DATE)), '11:30:00', 117.00);
END
GO
