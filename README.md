# Stylio_Salon

# User login Table

 CREATE TABLE [dbo].[Users] (
  [UserId]       INT            IDENTITY (1, 1) NOT NULL,
  [Name]         NVARCHAR (100) NOT NULL,
  [Email]        NVARCHAR (150) NOT NULL,
  [MobileNumber] NVARCHAR (15)  NOT NULL,
  [Password]     NVARCHAR (255) NOT NULL,
  [ProfileImg]   NVARCHAR (255) NULL,
  PRIMARY KEY CLUSTERED ([UserId] ASC),
  UNIQUE NONCLUSTERED ([Email] ASC)
 );

# Add Salon Table

#  CREATE TABLE [dbo].[Salon] (
#    [SalonId]          INT            IDENTITY (1, 1) NOT NULL,
#    [OwnerName]        NVARCHAR (100) NOT NULL,
#    [PhoneNumber]      NVARCHAR (15)  NOT NULL,
#    [Email]            NVARCHAR (150) NOT NULL,
#    [SalonDescription] NVARCHAR (500) NULL,
#    [Address]          NVARCHAR (300) NOT NULL,
#    [OpeningHour]      NVARCHAR (50)  NULL,
#    [SalonImage]       NVARCHAR (255) NULL,
#    [SalonName]        NVARCHAR (150) NOT NULL,
#    PRIMARY KEY CLUSTERED ([SalonId] ASC),
#    UNIQUE NONCLUSTERED ([Email] ASC)
# );


#
#
#
#
#
#
#
#


