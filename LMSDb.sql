USE [master]
GO
/****** Object:  Database [LMSDb]    Script Date: 5/9/2025 3:32:10 PM ******/
CREATE DATABASE [LMSDb]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'LMSDb', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL16.MSSQLSERVER\MSSQL\DATA\LMSDb.mdf' , SIZE = 73728KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'LMSDb_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL16.MSSQLSERVER\MSSQL\DATA\LMSDb_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [LMSDb].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [LMSDb] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [LMSDb] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [LMSDb] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [LMSDb] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [LMSDb] SET ARITHABORT OFF 
GO
ALTER DATABASE [LMSDb] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [LMSDb] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [LMSDb] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [LMSDb] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [LMSDb] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [LMSDb] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [LMSDb] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [LMSDb] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [LMSDb] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [LMSDb] SET  ENABLE_BROKER 
GO
ALTER DATABASE [LMSDb] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [LMSDb] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [LMSDb] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [LMSDb] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [LMSDb] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [LMSDb] SET READ_COMMITTED_SNAPSHOT ON 
GO
ALTER DATABASE [LMSDb] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [LMSDb] SET RECOVERY FULL 
GO
ALTER DATABASE [LMSDb] SET  MULTI_USER 
GO
ALTER DATABASE [LMSDb] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [LMSDb] SET DB_CHAINING OFF 
GO
ALTER DATABASE [LMSDb] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [LMSDb] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [LMSDb] SET DELAYED_DURABILITY = DISABLED 
GO
EXEC sys.sp_db_vardecimal_storage_format N'LMSDb', N'ON'
GO
ALTER DATABASE [LMSDb] SET QUERY_STORE = ON
GO
ALTER DATABASE [LMSDb] SET QUERY_STORE (OPERATION_MODE = READ_WRITE, CLEANUP_POLICY = (STALE_QUERY_THRESHOLD_DAYS = 30), DATA_FLUSH_INTERVAL_SECONDS = 900, INTERVAL_LENGTH_MINUTES = 60, MAX_STORAGE_SIZE_MB = 1000, QUERY_CAPTURE_MODE = AUTO, SIZE_BASED_CLEANUP_MODE = AUTO)
GO
USE [LMSDb]
GO
ALTER DATABASE SCOPED CONFIGURATION SET ACCELERATED_PLAN_FORCING = ON;
GO
ALTER DATABASE SCOPED CONFIGURATION SET ASYNC_STATS_UPDATE_WAIT_AT_LOW_PRIORITY = OFF;
GO
ALTER DATABASE SCOPED CONFIGURATION SET BATCH_MODE_ADAPTIVE_JOINS = ON;
GO
ALTER DATABASE SCOPED CONFIGURATION SET BATCH_MODE_MEMORY_GRANT_FEEDBACK = ON;
GO
ALTER DATABASE SCOPED CONFIGURATION SET BATCH_MODE_ON_ROWSTORE = ON;
GO
ALTER DATABASE SCOPED CONFIGURATION SET CE_FEEDBACK = ON;
GO
ALTER DATABASE SCOPED CONFIGURATION SET DEFERRED_COMPILATION_TV = ON;
GO
ALTER DATABASE SCOPED CONFIGURATION SET DOP_FEEDBACK = OFF;
GO
ALTER DATABASE SCOPED CONFIGURATION SET DW_COMPATIBILITY_LEVEL = 0;
GO
ALTER DATABASE SCOPED CONFIGURATION SET ELEVATE_ONLINE = OFF;
GO
ALTER DATABASE SCOPED CONFIGURATION SET ELEVATE_RESUMABLE = OFF;
GO
ALTER DATABASE SCOPED CONFIGURATION SET EXEC_QUERY_STATS_FOR_SCALAR_FUNCTIONS = ON;
GO
ALTER DATABASE SCOPED CONFIGURATION SET FORCE_SHOWPLAN_RUNTIME_PARAMETER_COLLECTION = OFF;
GO
ALTER DATABASE SCOPED CONFIGURATION SET GLOBAL_TEMPORARY_TABLE_AUTO_DROP = ON;
GO
ALTER DATABASE SCOPED CONFIGURATION SET IDENTITY_CACHE = ON;
GO
ALTER DATABASE SCOPED CONFIGURATION SET INTERLEAVED_EXECUTION_TVF = ON;
GO
ALTER DATABASE SCOPED CONFIGURATION SET ISOLATE_SECURITY_POLICY_CARDINALITY = OFF;
GO
ALTER DATABASE SCOPED CONFIGURATION SET LAST_QUERY_PLAN_STATS = OFF;
GO
ALTER DATABASE SCOPED CONFIGURATION SET LEDGER_DIGEST_STORAGE_ENDPOINT = OFF;
GO
ALTER DATABASE SCOPED CONFIGURATION SET LEGACY_CARDINALITY_ESTIMATION = OFF;
GO
ALTER DATABASE SCOPED CONFIGURATION FOR SECONDARY SET LEGACY_CARDINALITY_ESTIMATION = PRIMARY;
GO
ALTER DATABASE SCOPED CONFIGURATION SET LIGHTWEIGHT_QUERY_PROFILING = ON;
GO
ALTER DATABASE SCOPED CONFIGURATION SET MAXDOP = 0;
GO
ALTER DATABASE SCOPED CONFIGURATION FOR SECONDARY SET MAXDOP = PRIMARY;
GO
ALTER DATABASE SCOPED CONFIGURATION SET MEMORY_GRANT_FEEDBACK_PERCENTILE_GRANT = ON;
GO
ALTER DATABASE SCOPED CONFIGURATION SET MEMORY_GRANT_FEEDBACK_PERSISTENCE = ON;
GO
ALTER DATABASE SCOPED CONFIGURATION SET OPTIMIZED_PLAN_FORCING = ON;
GO
ALTER DATABASE SCOPED CONFIGURATION SET OPTIMIZE_FOR_AD_HOC_WORKLOADS = OFF;
GO
ALTER DATABASE SCOPED CONFIGURATION SET PARAMETER_SENSITIVE_PLAN_OPTIMIZATION = ON;
GO
ALTER DATABASE SCOPED CONFIGURATION SET PARAMETER_SNIFFING = ON;
GO
ALTER DATABASE SCOPED CONFIGURATION FOR SECONDARY SET PARAMETER_SNIFFING = PRIMARY;
GO
ALTER DATABASE SCOPED CONFIGURATION SET PAUSED_RESUMABLE_INDEX_ABORT_DURATION_MINUTES = 1440;
GO
ALTER DATABASE SCOPED CONFIGURATION SET QUERY_OPTIMIZER_HOTFIXES = OFF;
GO
ALTER DATABASE SCOPED CONFIGURATION FOR SECONDARY SET QUERY_OPTIMIZER_HOTFIXES = PRIMARY;
GO
ALTER DATABASE SCOPED CONFIGURATION SET ROW_MODE_MEMORY_GRANT_FEEDBACK = ON;
GO
ALTER DATABASE SCOPED CONFIGURATION SET TSQL_SCALAR_UDF_INLINING = ON;
GO
ALTER DATABASE SCOPED CONFIGURATION SET VERBOSE_TRUNCATION_WARNINGS = ON;
GO
ALTER DATABASE SCOPED CONFIGURATION SET XTP_PROCEDURE_EXECUTION_STATISTICS = OFF;
GO
ALTER DATABASE SCOPED CONFIGURATION SET XTP_QUERY_EXECUTION_STATISTICS = OFF;
GO
USE [LMSDb]
GO
/****** Object:  User [Supervisor]    Script Date: 5/9/2025 3:32:14 PM ******/
CREATE USER [Supervisor] WITHOUT LOGIN WITH DEFAULT_SCHEMA=[dbo]
GO
/****** Object:  Table [dbo].[__EFMigrationsHistory]    Script Date: 5/9/2025 3:32:15 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[__EFMigrationsHistory](
	[MigrationId] [nvarchar](150) NOT NULL,
	[ProductVersion] [nvarchar](32) NOT NULL,
 CONSTRAINT [PK___EFMigrationsHistory] PRIMARY KEY CLUSTERED 
(
	[MigrationId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[AbpAuditLogs]    Script Date: 5/9/2025 3:32:18 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AbpAuditLogs](
	[Id] [bigint] IDENTITY(1,1) NOT NULL,
	[TenantId] [int] NULL,
	[UserId] [bigint] NULL,
	[ServiceName] [nvarchar](256) NULL,
	[MethodName] [nvarchar](256) NULL,
	[Parameters] [nvarchar](1024) NULL,
	[ReturnValue] [nvarchar](max) NULL,
	[ExecutionTime] [datetime2](7) NOT NULL,
	[ExecutionDuration] [int] NOT NULL,
	[ClientIpAddress] [nvarchar](64) NULL,
	[ClientName] [nvarchar](128) NULL,
	[BrowserInfo] [nvarchar](512) NULL,
	[ExceptionMessage] [nvarchar](1024) NULL,
	[Exception] [nvarchar](2000) NULL,
	[ImpersonatorUserId] [bigint] NULL,
	[ImpersonatorTenantId] [int] NULL,
	[CustomData] [nvarchar](2000) NULL,
 CONSTRAINT [PK_AbpAuditLogs] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[AbpBackgroundJobs]    Script Date: 5/9/2025 3:32:18 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AbpBackgroundJobs](
	[Id] [bigint] IDENTITY(1,1) NOT NULL,
	[JobType] [nvarchar](512) NOT NULL,
	[JobArgs] [nvarchar](max) NOT NULL,
	[TryCount] [smallint] NOT NULL,
	[NextTryTime] [datetime2](7) NOT NULL,
	[LastTryTime] [datetime2](7) NULL,
	[IsAbandoned] [bit] NOT NULL,
	[Priority] [tinyint] NOT NULL,
	[CreationTime] [datetime2](7) NOT NULL,
	[CreatorUserId] [bigint] NULL,
 CONSTRAINT [PK_AbpBackgroundJobs] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[AbpDynamicEntityProperties]    Script Date: 5/9/2025 3:32:18 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AbpDynamicEntityProperties](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[EntityFullName] [nvarchar](256) NULL,
	[DynamicPropertyId] [int] NOT NULL,
	[TenantId] [int] NULL,
 CONSTRAINT [PK_AbpDynamicEntityProperties] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[AbpDynamicEntityPropertyValues]    Script Date: 5/9/2025 3:32:18 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AbpDynamicEntityPropertyValues](
	[Id] [bigint] IDENTITY(1,1) NOT NULL,
	[Value] [nvarchar](max) NOT NULL,
	[EntityId] [nvarchar](max) NULL,
	[DynamicEntityPropertyId] [int] NOT NULL,
	[TenantId] [int] NULL,
 CONSTRAINT [PK_AbpDynamicEntityPropertyValues] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[AbpDynamicProperties]    Script Date: 5/9/2025 3:32:18 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AbpDynamicProperties](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[PropertyName] [nvarchar](256) NULL,
	[DisplayName] [nvarchar](max) NULL,
	[InputType] [nvarchar](max) NULL,
	[Permission] [nvarchar](max) NULL,
	[TenantId] [int] NULL,
 CONSTRAINT [PK_AbpDynamicProperties] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[AbpDynamicPropertyValues]    Script Date: 5/9/2025 3:32:19 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AbpDynamicPropertyValues](
	[Id] [bigint] IDENTITY(1,1) NOT NULL,
	[Value] [nvarchar](max) NOT NULL,
	[TenantId] [int] NULL,
	[DynamicPropertyId] [int] NOT NULL,
 CONSTRAINT [PK_AbpDynamicPropertyValues] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[AbpEditions]    Script Date: 5/9/2025 3:32:19 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AbpEditions](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](32) NOT NULL,
	[DisplayName] [nvarchar](64) NOT NULL,
	[CreationTime] [datetime2](7) NOT NULL,
	[CreatorUserId] [bigint] NULL,
	[LastModificationTime] [datetime2](7) NULL,
	[LastModifierUserId] [bigint] NULL,
	[IsDeleted] [bit] NOT NULL,
	[DeleterUserId] [bigint] NULL,
	[DeletionTime] [datetime2](7) NULL,
 CONSTRAINT [PK_AbpEditions] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[AbpEntityChanges]    Script Date: 5/9/2025 3:32:19 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AbpEntityChanges](
	[Id] [bigint] IDENTITY(1,1) NOT NULL,
	[ChangeTime] [datetime2](7) NOT NULL,
	[ChangeType] [tinyint] NOT NULL,
	[EntityChangeSetId] [bigint] NOT NULL,
	[EntityId] [nvarchar](48) NULL,
	[EntityTypeFullName] [nvarchar](192) NULL,
	[TenantId] [int] NULL,
 CONSTRAINT [PK_AbpEntityChanges] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[AbpEntityChangeSets]    Script Date: 5/9/2025 3:32:19 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AbpEntityChangeSets](
	[Id] [bigint] IDENTITY(1,1) NOT NULL,
	[BrowserInfo] [nvarchar](512) NULL,
	[ClientIpAddress] [nvarchar](64) NULL,
	[ClientName] [nvarchar](128) NULL,
	[CreationTime] [datetime2](7) NOT NULL,
	[ExtensionData] [nvarchar](max) NULL,
	[ImpersonatorTenantId] [int] NULL,
	[ImpersonatorUserId] [bigint] NULL,
	[Reason] [nvarchar](256) NULL,
	[TenantId] [int] NULL,
	[UserId] [bigint] NULL,
 CONSTRAINT [PK_AbpEntityChangeSets] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[AbpEntityPropertyChanges]    Script Date: 5/9/2025 3:32:19 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AbpEntityPropertyChanges](
	[Id] [bigint] IDENTITY(1,1) NOT NULL,
	[EntityChangeId] [bigint] NOT NULL,
	[NewValue] [nvarchar](512) NULL,
	[OriginalValue] [nvarchar](512) NULL,
	[PropertyName] [nvarchar](96) NULL,
	[PropertyTypeFullName] [nvarchar](192) NULL,
	[TenantId] [int] NULL,
	[NewValueHash] [nvarchar](max) NULL,
	[OriginalValueHash] [nvarchar](max) NULL,
 CONSTRAINT [PK_AbpEntityPropertyChanges] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[AbpFeatures]    Script Date: 5/9/2025 3:32:19 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AbpFeatures](
	[Id] [bigint] IDENTITY(1,1) NOT NULL,
	[TenantId] [int] NULL,
	[Name] [nvarchar](128) NOT NULL,
	[Value] [nvarchar](2000) NOT NULL,
	[Discriminator] [nvarchar](21) NOT NULL,
	[EditionId] [int] NULL,
	[CreationTime] [datetime2](7) NOT NULL,
	[CreatorUserId] [bigint] NULL,
 CONSTRAINT [PK_AbpFeatures] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[AbpLanguages]    Script Date: 5/9/2025 3:32:19 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AbpLanguages](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[TenantId] [int] NULL,
	[Name] [nvarchar](128) NOT NULL,
	[DisplayName] [nvarchar](64) NOT NULL,
	[Icon] [nvarchar](128) NULL,
	[IsDisabled] [bit] NOT NULL,
	[CreationTime] [datetime2](7) NOT NULL,
	[CreatorUserId] [bigint] NULL,
	[LastModificationTime] [datetime2](7) NULL,
	[LastModifierUserId] [bigint] NULL,
	[IsDeleted] [bit] NOT NULL,
	[DeleterUserId] [bigint] NULL,
	[DeletionTime] [datetime2](7) NULL,
 CONSTRAINT [PK_AbpLanguages] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[AbpLanguageTexts]    Script Date: 5/9/2025 3:32:19 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AbpLanguageTexts](
	[Id] [bigint] IDENTITY(1,1) NOT NULL,
	[TenantId] [int] NULL,
	[LanguageName] [nvarchar](128) NOT NULL,
	[Source] [nvarchar](128) NOT NULL,
	[Key] [nvarchar](256) NOT NULL,
	[Value] [nvarchar](max) NOT NULL,
	[CreationTime] [datetime2](7) NOT NULL,
	[CreatorUserId] [bigint] NULL,
	[LastModificationTime] [datetime2](7) NULL,
	[LastModifierUserId] [bigint] NULL,
 CONSTRAINT [PK_AbpLanguageTexts] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[AbpNotifications]    Script Date: 5/9/2025 3:32:19 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AbpNotifications](
	[Id] [uniqueidentifier] NOT NULL,
	[NotificationName] [nvarchar](96) NOT NULL,
	[Data] [nvarchar](max) NULL,
	[DataTypeName] [nvarchar](512) NULL,
	[EntityTypeName] [nvarchar](250) NULL,
	[EntityTypeAssemblyQualifiedName] [nvarchar](512) NULL,
	[EntityId] [nvarchar](96) NULL,
	[Severity] [tinyint] NOT NULL,
	[UserIds] [nvarchar](max) NULL,
	[ExcludedUserIds] [nvarchar](max) NULL,
	[TenantIds] [nvarchar](max) NULL,
	[TargetNotifiers] [nvarchar](1024) NULL,
	[CreationTime] [datetime2](7) NOT NULL,
	[CreatorUserId] [bigint] NULL,
 CONSTRAINT [PK_AbpNotifications] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[AbpNotificationSubscriptions]    Script Date: 5/9/2025 3:32:19 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AbpNotificationSubscriptions](
	[Id] [uniqueidentifier] NOT NULL,
	[TenantId] [int] NULL,
	[UserId] [bigint] NOT NULL,
	[NotificationName] [nvarchar](96) NULL,
	[EntityTypeName] [nvarchar](250) NULL,
	[EntityTypeAssemblyQualifiedName] [nvarchar](512) NULL,
	[EntityId] [nvarchar](96) NULL,
	[TargetNotifiers] [nvarchar](1024) NULL,
	[CreationTime] [datetime2](7) NOT NULL,
	[CreatorUserId] [bigint] NULL,
 CONSTRAINT [PK_AbpNotificationSubscriptions] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[AbpOrganizationUnitRoles]    Script Date: 5/9/2025 3:32:19 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AbpOrganizationUnitRoles](
	[Id] [bigint] IDENTITY(1,1) NOT NULL,
	[TenantId] [int] NULL,
	[RoleId] [int] NOT NULL,
	[OrganizationUnitId] [bigint] NOT NULL,
	[IsDeleted] [bit] NOT NULL,
	[CreationTime] [datetime2](7) NOT NULL,
	[CreatorUserId] [bigint] NULL,
 CONSTRAINT [PK_AbpOrganizationUnitRoles] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[AbpOrganizationUnits]    Script Date: 5/9/2025 3:32:19 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AbpOrganizationUnits](
	[Id] [bigint] IDENTITY(1,1) NOT NULL,
	[TenantId] [int] NULL,
	[ParentId] [bigint] NULL,
	[Code] [nvarchar](95) NOT NULL,
	[DisplayName] [nvarchar](128) NOT NULL,
	[CreationTime] [datetime2](7) NOT NULL,
	[CreatorUserId] [bigint] NULL,
	[LastModificationTime] [datetime2](7) NULL,
	[LastModifierUserId] [bigint] NULL,
	[IsDeleted] [bit] NOT NULL,
	[DeleterUserId] [bigint] NULL,
	[DeletionTime] [datetime2](7) NULL,
 CONSTRAINT [PK_AbpOrganizationUnits] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[AbpPermissions]    Script Date: 5/9/2025 3:32:20 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AbpPermissions](
	[Id] [bigint] IDENTITY(1,1) NOT NULL,
	[TenantId] [int] NULL,
	[Name] [nvarchar](128) NOT NULL,
	[IsGranted] [bit] NOT NULL,
	[Discriminator] [nvarchar](21) NOT NULL,
	[RoleId] [int] NULL,
	[UserId] [bigint] NULL,
	[CreationTime] [datetime2](7) NOT NULL,
	[CreatorUserId] [bigint] NULL,
 CONSTRAINT [PK_AbpPermissions] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[AbpRoleClaims]    Script Date: 5/9/2025 3:32:20 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AbpRoleClaims](
	[Id] [bigint] IDENTITY(1,1) NOT NULL,
	[TenantId] [int] NULL,
	[RoleId] [int] NOT NULL,
	[ClaimType] [nvarchar](256) NULL,
	[ClaimValue] [nvarchar](max) NULL,
	[CreationTime] [datetime2](7) NOT NULL,
	[CreatorUserId] [bigint] NULL,
 CONSTRAINT [PK_AbpRoleClaims] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[AbpRoles]    Script Date: 5/9/2025 3:32:20 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AbpRoles](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Description] [nvarchar](max) NULL,
	[CreationTime] [datetime2](7) NOT NULL,
	[CreatorUserId] [bigint] NULL,
	[LastModificationTime] [datetime2](7) NULL,
	[LastModifierUserId] [bigint] NULL,
	[IsDeleted] [bit] NOT NULL,
	[DeleterUserId] [bigint] NULL,
	[DeletionTime] [datetime2](7) NULL,
	[TenantId] [int] NULL,
	[Name] [nvarchar](32) NOT NULL,
	[DisplayName] [nvarchar](64) NOT NULL,
	[IsStatic] [bit] NOT NULL,
	[IsDefault] [bit] NOT NULL,
	[NormalizedName] [nvarchar](32) NOT NULL,
	[ConcurrencyStamp] [nvarchar](128) NULL,
 CONSTRAINT [PK_AbpRoles] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[AbpSettings]    Script Date: 5/9/2025 3:32:20 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AbpSettings](
	[Id] [bigint] IDENTITY(1,1) NOT NULL,
	[TenantId] [int] NULL,
	[UserId] [bigint] NULL,
	[Name] [nvarchar](256) NOT NULL,
	[Value] [nvarchar](max) NULL,
	[CreationTime] [datetime2](7) NOT NULL,
	[CreatorUserId] [bigint] NULL,
	[LastModificationTime] [datetime2](7) NULL,
	[LastModifierUserId] [bigint] NULL,
 CONSTRAINT [PK_AbpSettings] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[AbpTenantNotifications]    Script Date: 5/9/2025 3:32:20 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AbpTenantNotifications](
	[Id] [uniqueidentifier] NOT NULL,
	[TenantId] [int] NULL,
	[NotificationName] [nvarchar](96) NOT NULL,
	[Data] [nvarchar](max) NULL,
	[DataTypeName] [nvarchar](512) NULL,
	[EntityTypeName] [nvarchar](250) NULL,
	[EntityTypeAssemblyQualifiedName] [nvarchar](512) NULL,
	[EntityId] [nvarchar](96) NULL,
	[Severity] [tinyint] NOT NULL,
	[CreationTime] [datetime2](7) NOT NULL,
	[CreatorUserId] [bigint] NULL,
 CONSTRAINT [PK_AbpTenantNotifications] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[AbpTenants]    Script Date: 5/9/2025 3:32:20 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AbpTenants](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[CreationTime] [datetime2](7) NOT NULL,
	[CreatorUserId] [bigint] NULL,
	[LastModificationTime] [datetime2](7) NULL,
	[LastModifierUserId] [bigint] NULL,
	[IsDeleted] [bit] NOT NULL,
	[DeleterUserId] [bigint] NULL,
	[DeletionTime] [datetime2](7) NULL,
	[TenancyName] [nvarchar](64) NOT NULL,
	[Name] [nvarchar](128) NOT NULL,
	[ConnectionString] [nvarchar](1024) NULL,
	[IsActive] [bit] NOT NULL,
	[EditionId] [int] NULL,
 CONSTRAINT [PK_AbpTenants] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[AbpUserAccounts]    Script Date: 5/9/2025 3:32:20 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AbpUserAccounts](
	[Id] [bigint] IDENTITY(1,1) NOT NULL,
	[TenantId] [int] NULL,
	[UserId] [bigint] NOT NULL,
	[UserLinkId] [bigint] NULL,
	[UserName] [nvarchar](256) NULL,
	[EmailAddress] [nvarchar](256) NULL,
	[CreationTime] [datetime2](7) NOT NULL,
	[CreatorUserId] [bigint] NULL,
	[LastModificationTime] [datetime2](7) NULL,
	[LastModifierUserId] [bigint] NULL,
	[IsDeleted] [bit] NOT NULL,
	[DeleterUserId] [bigint] NULL,
	[DeletionTime] [datetime2](7) NULL,
 CONSTRAINT [PK_AbpUserAccounts] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[AbpUserClaims]    Script Date: 5/9/2025 3:32:20 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AbpUserClaims](
	[Id] [bigint] IDENTITY(1,1) NOT NULL,
	[TenantId] [int] NULL,
	[UserId] [bigint] NOT NULL,
	[ClaimType] [nvarchar](256) NULL,
	[ClaimValue] [nvarchar](max) NULL,
	[CreationTime] [datetime2](7) NOT NULL,
	[CreatorUserId] [bigint] NULL,
 CONSTRAINT [PK_AbpUserClaims] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[AbpUserLoginAttempts]    Script Date: 5/9/2025 3:32:20 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AbpUserLoginAttempts](
	[Id] [bigint] IDENTITY(1,1) NOT NULL,
	[TenantId] [int] NULL,
	[TenancyName] [nvarchar](64) NULL,
	[UserId] [bigint] NULL,
	[UserNameOrEmailAddress] [nvarchar](256) NULL,
	[ClientIpAddress] [nvarchar](64) NULL,
	[ClientName] [nvarchar](128) NULL,
	[BrowserInfo] [nvarchar](512) NULL,
	[Result] [tinyint] NOT NULL,
	[FailReason] [nvarchar](1024) NULL,
	[CreationTime] [datetime2](7) NOT NULL,
 CONSTRAINT [PK_AbpUserLoginAttempts] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[AbpUserLogins]    Script Date: 5/9/2025 3:32:20 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AbpUserLogins](
	[Id] [bigint] IDENTITY(1,1) NOT NULL,
	[TenantId] [int] NULL,
	[UserId] [bigint] NOT NULL,
	[LoginProvider] [nvarchar](128) NOT NULL,
	[ProviderKey] [nvarchar](256) NOT NULL,
 CONSTRAINT [PK_AbpUserLogins] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[AbpUserNotifications]    Script Date: 5/9/2025 3:32:20 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AbpUserNotifications](
	[Id] [uniqueidentifier] NOT NULL,
	[TenantId] [int] NULL,
	[UserId] [bigint] NOT NULL,
	[TenantNotificationId] [uniqueidentifier] NOT NULL,
	[State] [int] NOT NULL,
	[CreationTime] [datetime2](7) NOT NULL,
	[TargetNotifiers] [nvarchar](1024) NULL,
 CONSTRAINT [PK_AbpUserNotifications] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[AbpUserOrganizationUnits]    Script Date: 5/9/2025 3:32:21 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AbpUserOrganizationUnits](
	[Id] [bigint] IDENTITY(1,1) NOT NULL,
	[TenantId] [int] NULL,
	[UserId] [bigint] NOT NULL,
	[OrganizationUnitId] [bigint] NOT NULL,
	[IsDeleted] [bit] NOT NULL,
	[CreationTime] [datetime2](7) NOT NULL,
	[CreatorUserId] [bigint] NULL,
 CONSTRAINT [PK_AbpUserOrganizationUnits] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[AbpUserRoles]    Script Date: 5/9/2025 3:32:21 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AbpUserRoles](
	[Id] [bigint] IDENTITY(1,1) NOT NULL,
	[TenantId] [int] NULL,
	[UserId] [bigint] NOT NULL,
	[RoleId] [int] NOT NULL,
	[CreationTime] [datetime2](7) NOT NULL,
	[CreatorUserId] [bigint] NULL,
 CONSTRAINT [PK_AbpUserRoles] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[AbpUsers]    Script Date: 5/9/2025 3:32:21 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AbpUsers](
	[Id] [bigint] IDENTITY(1,1) NOT NULL,
	[CreationTime] [datetime2](7) NOT NULL,
	[CreatorUserId] [bigint] NULL,
	[LastModificationTime] [datetime2](7) NULL,
	[LastModifierUserId] [bigint] NULL,
	[IsDeleted] [bit] NOT NULL,
	[DeleterUserId] [bigint] NULL,
	[DeletionTime] [datetime2](7) NULL,
	[AuthenticationSource] [nvarchar](64) NULL,
	[UserName] [nvarchar](256) NOT NULL,
	[TenantId] [int] NULL,
	[EmailAddress] [nvarchar](256) NOT NULL,
	[Name] [nvarchar](64) NOT NULL,
	[Surname] [nvarchar](64) NOT NULL,
	[Password] [nvarchar](128) NOT NULL,
	[EmailConfirmationCode] [nvarchar](328) NULL,
	[PasswordResetCode] [nvarchar](328) NULL,
	[LockoutEndDateUtc] [datetime2](7) NULL,
	[AccessFailedCount] [int] NOT NULL,
	[IsLockoutEnabled] [bit] NOT NULL,
	[PhoneNumber] [nvarchar](32) NULL,
	[IsPhoneNumberConfirmed] [bit] NOT NULL,
	[SecurityStamp] [nvarchar](128) NULL,
	[IsTwoFactorEnabled] [bit] NOT NULL,
	[IsEmailConfirmed] [bit] NOT NULL,
	[IsActive] [bit] NOT NULL,
	[NormalizedUserName] [nvarchar](256) NOT NULL,
	[NormalizedEmailAddress] [nvarchar](256) NOT NULL,
	[ConcurrencyStamp] [nvarchar](128) NULL,
 CONSTRAINT [PK_AbpUsers] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[AbpUserTokens]    Script Date: 5/9/2025 3:32:21 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AbpUserTokens](
	[Id] [bigint] IDENTITY(1,1) NOT NULL,
	[TenantId] [int] NULL,
	[UserId] [bigint] NOT NULL,
	[LoginProvider] [nvarchar](128) NULL,
	[Name] [nvarchar](128) NULL,
	[Value] [nvarchar](512) NULL,
	[ExpireDate] [datetime2](7) NULL,
 CONSTRAINT [PK_AbpUserTokens] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[AbpWebhookEvents]    Script Date: 5/9/2025 3:32:21 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AbpWebhookEvents](
	[Id] [uniqueidentifier] NOT NULL,
	[WebhookName] [nvarchar](max) NOT NULL,
	[Data] [nvarchar](max) NULL,
	[CreationTime] [datetime2](7) NOT NULL,
	[TenantId] [int] NULL,
	[IsDeleted] [bit] NOT NULL,
	[DeletionTime] [datetime2](7) NULL,
 CONSTRAINT [PK_AbpWebhookEvents] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[AbpWebhookSendAttempts]    Script Date: 5/9/2025 3:32:21 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AbpWebhookSendAttempts](
	[Id] [uniqueidentifier] NOT NULL,
	[WebhookEventId] [uniqueidentifier] NOT NULL,
	[WebhookSubscriptionId] [uniqueidentifier] NOT NULL,
	[Response] [nvarchar](max) NULL,
	[ResponseStatusCode] [int] NULL,
	[CreationTime] [datetime2](7) NOT NULL,
	[LastModificationTime] [datetime2](7) NULL,
	[TenantId] [int] NULL,
 CONSTRAINT [PK_AbpWebhookSendAttempts] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[AbpWebhookSubscriptions]    Script Date: 5/9/2025 3:32:21 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AbpWebhookSubscriptions](
	[Id] [uniqueidentifier] NOT NULL,
	[TenantId] [int] NULL,
	[WebhookUri] [nvarchar](max) NOT NULL,
	[Secret] [nvarchar](max) NOT NULL,
	[IsActive] [bit] NOT NULL,
	[Webhooks] [nvarchar](max) NULL,
	[Headers] [nvarchar](max) NULL,
	[CreationTime] [datetime2](7) NOT NULL,
	[CreatorUserId] [bigint] NULL,
 CONSTRAINT [PK_AbpWebhookSubscriptions] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[BusFeePlans]    Script Date: 5/9/2025 3:32:21 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[BusFeePlans](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Line] [nvarchar](max) NOT NULL,
	[ExpectedTotalAmount] [decimal](18, 2) NOT NULL,
	[FullAmountWith5PercentDiscount] [decimal](18, 2) NOT NULL,
	[FullAmountDueDate] [datetime2](7) NOT NULL,
 CONSTRAINT [PK_BusFeePlans] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[BusInstallments]    Script Date: 5/9/2025 3:32:22 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[BusInstallments](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[BusFeePlanId] [int] NOT NULL,
	[Order] [int] NOT NULL,
	[Amount] [decimal](18, 2) NOT NULL,
	[DueDate] [datetime2](7) NOT NULL,
 CONSTRAINT [PK_BusInstallments] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[EducationalFeePlans]    Script Date: 5/9/2025 3:32:22 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[EducationalFeePlans](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Grade] [nvarchar](max) NOT NULL,
	[ExpectedTotalAmount] [decimal](18, 2) NOT NULL,
	[FullAmountWith5PercentDiscount] [decimal](18, 2) NOT NULL,
	[FullAmountDueDate] [datetime2](7) NOT NULL,
 CONSTRAINT [PK_EducationalFeePlans] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[EducationalInstallments]    Script Date: 5/9/2025 3:32:22 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[EducationalInstallments](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[EducationalFeePlanId] [int] NOT NULL,
	[Order] [int] NOT NULL,
	[Amount] [decimal](18, 2) NOT NULL,
	[DueDate] [datetime2](7) NOT NULL,
 CONSTRAINT [PK_EducationalInstallments] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[StudentBusPayments]    Script Date: 5/9/2025 3:32:22 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[StudentBusPayments](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[BusSubscriptionId] [int] NOT NULL,
	[BusInstallmentId] [int] NULL,
	[IsFullPayment] [bit] NOT NULL,
	[PaymentDate] [datetime2](7) NOT NULL,
	[AmountPaid] [decimal](18, 2) NOT NULL,
	[Status] [int] NOT NULL,
	[PaymentStatusLastUpdate] [datetime2](7) NULL,
	[TransactionId] [nvarchar](max) NULL,
	[InvoiceNumber] [nvarchar](max) NULL,
 CONSTRAINT [PK_StudentBusPayments] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[StudentBusSubscriptions]    Script Date: 5/9/2025 3:32:22 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[StudentBusSubscriptions](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[StudentId] [int] NOT NULL,
	[BusFeePlanId] [int] NOT NULL,
	[SubscriptionDate] [datetime2](7) NOT NULL,
	[Status] [int] NOT NULL,
	[Notes] [nvarchar](max) NULL,
 CONSTRAINT [PK_StudentBusSubscriptions] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[StudentEducationalPayments]    Script Date: 5/9/2025 3:32:22 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[StudentEducationalPayments](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[StudentId] [int] NOT NULL,
	[EducationalInstallmentId] [int] NULL,
	[IsFullPayment] [bit] NOT NULL,
	[PaymentDate] [datetime2](7) NOT NULL,
	[AmountPaid] [decimal](18, 2) NOT NULL,
	[PaymentStatus] [int] NOT NULL,
	[PaymentStatusLastUpdate] [datetime2](7) NOT NULL,
	[TransactionId] [nvarchar](max) NULL,
	[InvoiceNumber] [nvarchar](max) NULL,
 CONSTRAINT [PK_StudentEducationalPayments] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Students]    Script Date: 5/9/2025 3:32:22 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Students](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[StudentId] [nvarchar](max) NULL,
	[Name] [nvarchar](max) NOT NULL,
	[Grade] [nvarchar](max) NOT NULL,
	[MobileNumber] [nvarchar](max) NOT NULL,
	[Status] [nvarchar](max) NULL,
	[PreviousAmount] [decimal](18, 2) NOT NULL,
 CONSTRAINT [PK_Students] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
INSERT [dbo].[__EFMigrationsHistory] ([MigrationId], [ProductVersion]) VALUES (N'20250506164602_InitialMigration', N'8.0.8')
GO
SET IDENTITY_INSERT [dbo].[AbpAuditLogs] ON 
GO
INSERT [dbo].[AbpAuditLogs] ([Id], [TenantId], [UserId], [ServiceName], [MethodName], [Parameters], [ReturnValue], [ExecutionTime], [ExecutionDuration], [ClientIpAddress], [ClientName], [BrowserInfo], [ExceptionMessage], [Exception], [ImpersonatorUserId], [ImpersonatorTenantId], [CustomData]) VALUES (1, 1, NULL, N'School.LMS.Web.Host.Controllers.HomeController', N'Index', N'{}', NULL, CAST(N'2025-05-06T20:39:45.9155779' AS DateTime2), 8, N'::1', NULL, N'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/135.0.0.0 Safari/537.36', NULL, NULL, NULL, 1, NULL)
GO
INSERT [dbo].[AbpAuditLogs] ([Id], [TenantId], [UserId], [ServiceName], [MethodName], [Parameters], [ReturnValue], [ExecutionTime], [ExecutionDuration], [ClientIpAddress], [ClientName], [BrowserInfo], [ExceptionMessage], [Exception], [ImpersonatorUserId], [ImpersonatorTenantId], [CustomData]) VALUES (2, 1, NULL, N'School.LMS.Web.Host.Controllers.AntiForgeryController', N'SetCookie', N'{}', NULL, CAST(N'2025-05-06T20:39:50.6004107' AS DateTime2), 13, N'::1', NULL, N'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/135.0.0.0 Safari/537.36', NULL, NULL, NULL, 1, NULL)
GO
INSERT [dbo].[AbpAuditLogs] ([Id], [TenantId], [UserId], [ServiceName], [MethodName], [Parameters], [ReturnValue], [ExecutionTime], [ExecutionDuration], [ClientIpAddress], [ClientName], [BrowserInfo], [ExceptionMessage], [Exception], [ImpersonatorUserId], [ImpersonatorTenantId], [CustomData]) VALUES (3, 1, NULL, N'School.LMS.Web.Host.Controllers.HomeController', N'Index', N'{}', NULL, CAST(N'2025-05-06T20:42:28.8734798' AS DateTime2), 10, N'::1', NULL, N'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/135.0.0.0 Safari/537.36', NULL, NULL, NULL, 1, NULL)
GO
INSERT [dbo].[AbpAuditLogs] ([Id], [TenantId], [UserId], [ServiceName], [MethodName], [Parameters], [ReturnValue], [ExecutionTime], [ExecutionDuration], [ClientIpAddress], [ClientName], [BrowserInfo], [ExceptionMessage], [Exception], [ImpersonatorUserId], [ImpersonatorTenantId], [CustomData]) VALUES (4, 1, NULL, N'School.LMS.Web.Host.Controllers.AntiForgeryController', N'SetCookie', N'{}', NULL, CAST(N'2025-05-06T20:42:34.9500361' AS DateTime2), 14, N'::1', NULL, N'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/135.0.0.0 Safari/537.36', NULL, NULL, NULL, 1, NULL)
GO
INSERT [dbo].[AbpAuditLogs] ([Id], [TenantId], [UserId], [ServiceName], [MethodName], [Parameters], [ReturnValue], [ExecutionTime], [ExecutionDuration], [ClientIpAddress], [ClientName], [BrowserInfo], [ExceptionMessage], [Exception], [ImpersonatorUserId], [ImpersonatorTenantId], [CustomData]) VALUES (5, 1, NULL, N'Abp.AspNetCore.Mvc.Controllers.AbpUserConfigurationController', N'GetAll', N'{}', NULL, CAST(N'2025-05-06T20:42:39.0949402' AS DateTime2), 193, N'::1', NULL, N'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/135.0.0.0 Safari/537.36', NULL, NULL, NULL, 1, NULL)
GO
INSERT [dbo].[AbpAuditLogs] ([Id], [TenantId], [UserId], [ServiceName], [MethodName], [Parameters], [ReturnValue], [ExecutionTime], [ExecutionDuration], [ClientIpAddress], [ClientName], [BrowserInfo], [ExceptionMessage], [Exception], [ImpersonatorUserId], [ImpersonatorTenantId], [CustomData]) VALUES (6, 1, NULL, N'Abp.AspNetCore.Mvc.Controllers.AbpUserConfigurationController', N'GetAll', N'{}', NULL, CAST(N'2025-05-06T20:43:20.1746530' AS DateTime2), 8, N'::1', NULL, N'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/135.0.0.0 Safari/537.36', NULL, NULL, NULL, 1, NULL)
GO
INSERT [dbo].[AbpAuditLogs] ([Id], [TenantId], [UserId], [ServiceName], [MethodName], [Parameters], [ReturnValue], [ExecutionTime], [ExecutionDuration], [ClientIpAddress], [ClientName], [BrowserInfo], [ExceptionMessage], [Exception], [ImpersonatorUserId], [ImpersonatorTenantId], [CustomData]) VALUES (7, 1, NULL, N'School.LMS.Controllers.TokenAuthController', N'Authenticate', N'{"model":{"userNameOrEmailAddress":"admin","rememberClient":false}}', NULL, CAST(N'2025-05-06T20:43:27.0655577' AS DateTime2), 494, N'::1', NULL, N'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/135.0.0.0 Safari/537.36', NULL, NULL, NULL, 1, NULL)
GO
INSERT [dbo].[AbpAuditLogs] ([Id], [TenantId], [UserId], [ServiceName], [MethodName], [Parameters], [ReturnValue], [ExecutionTime], [ExecutionDuration], [ClientIpAddress], [ClientName], [BrowserInfo], [ExceptionMessage], [Exception], [ImpersonatorUserId], [ImpersonatorTenantId], [CustomData]) VALUES (8, 1, 2, N'Abp.AspNetCore.Mvc.Controllers.AbpUserConfigurationController', N'GetAll', N'{}', NULL, CAST(N'2025-05-06T20:43:28.0603667' AS DateTime2), 146, N'::1', NULL, N'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/135.0.0.0 Safari/537.36', NULL, NULL, NULL, 1, NULL)
GO
INSERT [dbo].[AbpAuditLogs] ([Id], [TenantId], [UserId], [ServiceName], [MethodName], [Parameters], [ReturnValue], [ExecutionTime], [ExecutionDuration], [ClientIpAddress], [ClientName], [BrowserInfo], [ExceptionMessage], [Exception], [ImpersonatorUserId], [ImpersonatorTenantId], [CustomData]) VALUES (9, 1, 2, N'School.LMS.Users.UserAppService', N'GetAllAsync', N'{"input":{"keyword":null,"isActive":null,"skipCount":0,"maxResultCount":10}}', NULL, CAST(N'2025-05-06T20:43:36.0786424' AS DateTime2), 200, N'::1', NULL, N'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/135.0.0.0 Safari/537.36', NULL, NULL, NULL, 1, NULL)
GO
INSERT [dbo].[AbpAuditLogs] ([Id], [TenantId], [UserId], [ServiceName], [MethodName], [Parameters], [ReturnValue], [ExecutionTime], [ExecutionDuration], [ClientIpAddress], [ClientName], [BrowserInfo], [ExceptionMessage], [Exception], [ImpersonatorUserId], [ImpersonatorTenantId], [CustomData]) VALUES (10, 1, 2, N'School.LMS.Users.UserAppService', N'GetAsync', N'{"input":{"id":2}}', NULL, CAST(N'2025-05-06T20:43:42.5621917' AS DateTime2), 33, N'::1', NULL, N'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/135.0.0.0 Safari/537.36', NULL, NULL, NULL, 1, NULL)
GO
INSERT [dbo].[AbpAuditLogs] ([Id], [TenantId], [UserId], [ServiceName], [MethodName], [Parameters], [ReturnValue], [ExecutionTime], [ExecutionDuration], [ClientIpAddress], [ClientName], [BrowserInfo], [ExceptionMessage], [Exception], [ImpersonatorUserId], [ImpersonatorTenantId], [CustomData]) VALUES (11, 1, 2, N'School.LMS.Users.UserAppService', N'GetRoles', N'{}', NULL, CAST(N'2025-05-06T20:43:42.6376378' AS DateTime2), 26, N'::1', NULL, N'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/135.0.0.0 Safari/537.36', NULL, NULL, NULL, 1, NULL)
GO
INSERT [dbo].[AbpAuditLogs] ([Id], [TenantId], [UserId], [ServiceName], [MethodName], [Parameters], [ReturnValue], [ExecutionTime], [ExecutionDuration], [ClientIpAddress], [ClientName], [BrowserInfo], [ExceptionMessage], [Exception], [ImpersonatorUserId], [ImpersonatorTenantId], [CustomData]) VALUES (12, 1, 2, N'School.LMS.Users.UserAppService', N'GetAllAsync', N'{"input":{"keyword":null,"isActive":null,"skipCount":0,"maxResultCount":10}}', NULL, CAST(N'2025-05-06T20:43:58.1411738' AS DateTime2), 31, N'::1', NULL, N'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/135.0.0.0 Safari/537.36', NULL, NULL, NULL, 1, NULL)
GO
INSERT [dbo].[AbpAuditLogs] ([Id], [TenantId], [UserId], [ServiceName], [MethodName], [Parameters], [ReturnValue], [ExecutionTime], [ExecutionDuration], [ClientIpAddress], [ClientName], [BrowserInfo], [ExceptionMessage], [Exception], [ImpersonatorUserId], [ImpersonatorTenantId], [CustomData]) VALUES (13, 1, 2, N'School.LMS.Roles.RoleAppService', N'GetAllAsync', N'{"input":{"keyword":null,"skipCount":0,"maxResultCount":10}}', NULL, CAST(N'2025-05-06T20:44:03.6777692' AS DateTime2), 49, N'::1', NULL, N'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/135.0.0.0 Safari/537.36', NULL, NULL, NULL, 1, NULL)
GO
INSERT [dbo].[AbpAuditLogs] ([Id], [TenantId], [UserId], [ServiceName], [MethodName], [Parameters], [ReturnValue], [ExecutionTime], [ExecutionDuration], [ClientIpAddress], [ClientName], [BrowserInfo], [ExceptionMessage], [Exception], [ImpersonatorUserId], [ImpersonatorTenantId], [CustomData]) VALUES (14, 1, NULL, N'Abp.AspNetCore.Mvc.Controllers.AbpUserConfigurationController', N'GetAll', N'{}', NULL, CAST(N'2025-05-06T20:44:14.3988892' AS DateTime2), 3, N'::1', NULL, N'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/135.0.0.0 Safari/537.36', NULL, NULL, NULL, 1, NULL)
GO
INSERT [dbo].[AbpAuditLogs] ([Id], [TenantId], [UserId], [ServiceName], [MethodName], [Parameters], [ReturnValue], [ExecutionTime], [ExecutionDuration], [ClientIpAddress], [ClientName], [BrowserInfo], [ExceptionMessage], [Exception], [ImpersonatorUserId], [ImpersonatorTenantId], [CustomData]) VALUES (15, 1, NULL, N'Abp.AspNetCore.Mvc.Controllers.AbpUserConfigurationController', N'GetAll', N'{}', NULL, CAST(N'2025-05-06T20:44:37.2895070' AS DateTime2), 3, N'::1', NULL, N'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/136.0.0.0 Safari/537.36', NULL, NULL, NULL, 1, NULL)
GO
INSERT [dbo].[AbpAuditLogs] ([Id], [TenantId], [UserId], [ServiceName], [MethodName], [Parameters], [ReturnValue], [ExecutionTime], [ExecutionDuration], [ClientIpAddress], [ClientName], [BrowserInfo], [ExceptionMessage], [Exception], [ImpersonatorUserId], [ImpersonatorTenantId], [CustomData]) VALUES (16, 1, NULL, N'Abp.AspNetCore.Mvc.Controllers.AbpUserConfigurationController', N'GetAll', N'{}', NULL, CAST(N'2025-05-06T20:44:56.5743614' AS DateTime2), 7, N'::1', NULL, N'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/136.0.0.0 Safari/537.36 Edg/136.0.0.0', NULL, NULL, NULL, 1, NULL)
GO
INSERT [dbo].[AbpAuditLogs] ([Id], [TenantId], [UserId], [ServiceName], [MethodName], [Parameters], [ReturnValue], [ExecutionTime], [ExecutionDuration], [ClientIpAddress], [ClientName], [BrowserInfo], [ExceptionMessage], [Exception], [ImpersonatorUserId], [ImpersonatorTenantId], [CustomData]) VALUES (17, 1, NULL, N'Abp.AspNetCore.Mvc.Controllers.AbpUserConfigurationController', N'GetAll', N'{}', NULL, CAST(N'2025-05-06T20:45:14.8438477' AS DateTime2), 4, N'::1', NULL, N'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/135.0.0.0 Safari/537.36', NULL, NULL, NULL, 1, NULL)
GO
INSERT [dbo].[AbpAuditLogs] ([Id], [TenantId], [UserId], [ServiceName], [MethodName], [Parameters], [ReturnValue], [ExecutionTime], [ExecutionDuration], [ClientIpAddress], [ClientName], [BrowserInfo], [ExceptionMessage], [Exception], [ImpersonatorUserId], [ImpersonatorTenantId], [CustomData]) VALUES (18, 1, NULL, N'School.LMS.Controllers.TokenAuthController', N'Authenticate', N'{"model":{"userNameOrEmailAddress":"admin","rememberClient":false}}', NULL, CAST(N'2025-05-06T20:45:17.7390251' AS DateTime2), 216, N'::1', NULL, N'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/135.0.0.0 Safari/537.36', NULL, NULL, NULL, 1, NULL)
GO
INSERT [dbo].[AbpAuditLogs] ([Id], [TenantId], [UserId], [ServiceName], [MethodName], [Parameters], [ReturnValue], [ExecutionTime], [ExecutionDuration], [ClientIpAddress], [ClientName], [BrowserInfo], [ExceptionMessage], [Exception], [ImpersonatorUserId], [ImpersonatorTenantId], [CustomData]) VALUES (19, 1, 2, N'Abp.AspNetCore.Mvc.Controllers.AbpUserConfigurationController', N'GetAll', N'{}', NULL, CAST(N'2025-05-06T20:45:18.5528133' AS DateTime2), 7, N'::1', NULL, N'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/135.0.0.0 Safari/537.36', NULL, NULL, NULL, 1, NULL)
GO
INSERT [dbo].[AbpAuditLogs] ([Id], [TenantId], [UserId], [ServiceName], [MethodName], [Parameters], [ReturnValue], [ExecutionTime], [ExecutionDuration], [ClientIpAddress], [ClientName], [BrowserInfo], [ExceptionMessage], [Exception], [ImpersonatorUserId], [ImpersonatorTenantId], [CustomData]) VALUES (20, 1, 2, N'School.LMS.Users.UserAppService', N'GetAllAsync', N'{"input":{"keyword":null,"isActive":null,"skipCount":0,"maxResultCount":10}}', NULL, CAST(N'2025-05-06T20:45:22.7250849' AS DateTime2), 46, N'::1', NULL, N'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/135.0.0.0 Safari/537.36', NULL, NULL, NULL, 1, NULL)
GO
INSERT [dbo].[AbpAuditLogs] ([Id], [TenantId], [UserId], [ServiceName], [MethodName], [Parameters], [ReturnValue], [ExecutionTime], [ExecutionDuration], [ClientIpAddress], [ClientName], [BrowserInfo], [ExceptionMessage], [Exception], [ImpersonatorUserId], [ImpersonatorTenantId], [CustomData]) VALUES (21, 1, 2, N'School.LMS.EducationalFeePlan.EducationFeeService', N'GetAllEducationalFees', N'{}', NULL, CAST(N'2025-05-06T20:45:25.4901749' AS DateTime2), 26, N'::1', NULL, N'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/135.0.0.0 Safari/537.36', NULL, NULL, NULL, 1, NULL)
GO
INSERT [dbo].[AbpAuditLogs] ([Id], [TenantId], [UserId], [ServiceName], [MethodName], [Parameters], [ReturnValue], [ExecutionTime], [ExecutionDuration], [ClientIpAddress], [ClientName], [BrowserInfo], [ExceptionMessage], [Exception], [ImpersonatorUserId], [ImpersonatorTenantId], [CustomData]) VALUES (22, 1, 2, N'School.LMS.EducationalFeePlan.EducationFeeService', N'GetAllEducationalFees', N'{}', NULL, CAST(N'2025-05-06T20:45:25.4925352' AS DateTime2), 25, N'::1', NULL, N'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/135.0.0.0 Safari/537.36', NULL, NULL, NULL, 1, NULL)
GO
INSERT [dbo].[AbpAuditLogs] ([Id], [TenantId], [UserId], [ServiceName], [MethodName], [Parameters], [ReturnValue], [ExecutionTime], [ExecutionDuration], [ClientIpAddress], [ClientName], [BrowserInfo], [ExceptionMessage], [Exception], [ImpersonatorUserId], [ImpersonatorTenantId], [CustomData]) VALUES (23, 1, 2, N'School.LMS.Students.StudentImportService', N'GetAllAsync', N'{"input":{"keyword":null}}', NULL, CAST(N'2025-05-06T20:45:25.4919693' AS DateTime2), 509, N'::1', NULL, N'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/135.0.0.0 Safari/537.36', NULL, NULL, NULL, 1, NULL)
GO
INSERT [dbo].[AbpAuditLogs] ([Id], [TenantId], [UserId], [ServiceName], [MethodName], [Parameters], [ReturnValue], [ExecutionTime], [ExecutionDuration], [ClientIpAddress], [ClientName], [BrowserInfo], [ExceptionMessage], [Exception], [ImpersonatorUserId], [ImpersonatorTenantId], [CustomData]) VALUES (24, 1, 2, N'School.LMS.Students.StudentImportService', N'ImportStudents', N'{"studentDtos":[{"studentId":"125","name":"Ahmed Ali","grade":"Prim 2","mobileNumber":"01545646456","status":"New Common","previousAmount":450.0,"id":0},{"studentId":"436","name":"Mohamed Abdelmonem","grade":"Prim 3","mobileNumber":"01014267914","status":"New Common","previousAmount":1300.0,"id":0},{"studentId":"1127","name":"Ehab Osama","grade":"Prim 4","mobileNumber":"01234267685","status":"New Common","previousAmount":0.0,"id":0}]}', NULL, CAST(N'2025-05-06T20:45:30.4150126' AS DateTime2), 158, N'::1', NULL, N'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/135.0.0.0 Safari/537.36', NULL, NULL, NULL, 1, NULL)
GO
INSERT [dbo].[AbpAuditLogs] ([Id], [TenantId], [UserId], [ServiceName], [MethodName], [Parameters], [ReturnValue], [ExecutionTime], [ExecutionDuration], [ClientIpAddress], [ClientName], [BrowserInfo], [ExceptionMessage], [Exception], [ImpersonatorUserId], [ImpersonatorTenantId], [CustomData]) VALUES (25, 1, 2, N'School.LMS.BusFeePlan.Dto.BusFeeService', N'ImportBusFee', N'{"educationalFeeDtos":[{"line":"Line1","expectedAmount":9300.0,"firstInstallment":{"amount":2800.0,"dueDate":"2025-06-01T00:00:00+03:00"},"secondInstallment":{"amount":2800.0,"dueDate":"2025-08-01T00:00:00+03:00"},"thirdInstallment":{"amount":1900.0,"dueDate":"2025-10-01T00:00:00+03:00"},"fourthInstallment":{"amount":1800.0,"dueDate":"2025-12-01T00:00:00+02:00"},"fullAmountWithDiscount":{"amount":8835.0,"dueDate":"2025-06-01T00:00:00+03:00"},"id":0},{"line":"Line2","expectedAmount":9800.0,"firstInstallment":{"amount":2900.0,"dueDate":"2025-06-01T00:00:00+03:00"},"secondInstallment":{"amount":2900.0,"dueDate":"2025-08-01T00:00:00+03:00"},"thirdInstallment":{"amount":2000.0,"dueDate":"2025-10-01T00:00:00+03:00"},"fourthInstallment":{"amount":2000.0,"dueDate":"2025-12-01T00:00:00+02:00"},"fullAmountWithDiscount":{"amount":9310.0,"dueDate":"2025-06-01T00:00:00+03:00"},"id":0},{"line":"Line3","expectedAmount":10300.0,"firstInstallment":{"amount":3100.0,"dueDate":"2025-06-01T00:00:00+03:00"},"secondInstallment":...', NULL, CAST(N'2025-05-06T20:45:30.4237743' AS DateTime2), 243, N'::1', NULL, N'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/135.0.0.0 Safari/537.36', NULL, NULL, NULL, 1, NULL)
GO
INSERT [dbo].[AbpAuditLogs] ([Id], [TenantId], [UserId], [ServiceName], [MethodName], [Parameters], [ReturnValue], [ExecutionTime], [ExecutionDuration], [ClientIpAddress], [ClientName], [BrowserInfo], [ExceptionMessage], [Exception], [ImpersonatorUserId], [ImpersonatorTenantId], [CustomData]) VALUES (26, 1, 2, N'School.LMS.EducationalFeePlan.EducationFeeService', N'ImportEducationalFee', N'{"educationalFeeDtos":[{"grade":"KG 1","expectedAmount":28200.0,"firstInstallment":{"amount":8500.0,"dueDate":"2025-06-01T00:00:00+03:00"},"secondInstallment":{"amount":8500.0,"dueDate":"2025-08-01T00:00:00+03:00"},"thirdInstallment":{"amount":5600.0,"dueDate":"2025-10-01T00:00:00+03:00"},"fourthInstallment":{"amount":5600.0,"dueDate":"2025-12-01T00:00:00+02:00"},"fullAmountWithDiscount":{"amount":26790.0,"dueDate":"2025-06-01T00:00:00+03:00"},"id":0},{"grade":"KG 2","expectedAmount":28300.0,"firstInstallment":{"amount":8500.0,"dueDate":"2025-06-01T00:00:00+03:00"},"secondInstallment":{"amount":8500.0,"dueDate":"2025-08-01T00:00:00+03:00"},"thirdInstallment":{"amount":5700.0,"dueDate":"2025-10-01T00:00:00+03:00"},"fourthInstallment":{"amount":5600.0,"dueDate":"2025-12-01T00:00:00+02:00"},"fullAmountWithDiscount":{"amount":26885.0,"dueDate":"2025-06-01T00:00:00+03:00"},"id":0},{"grade":"Prim 1","expectedAmount":29700.0,"firstInstallment":{"amount":8900.0,"dueDate":"2025-06-01T00:00:00+03:00"},"secondInstall...', NULL, CAST(N'2025-05-06T20:45:30.4240178' AS DateTime2), 323, N'::1', NULL, N'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/135.0.0.0 Safari/537.36', NULL, NULL, NULL, 1, NULL)
GO
INSERT [dbo].[AbpAuditLogs] ([Id], [TenantId], [UserId], [ServiceName], [MethodName], [Parameters], [ReturnValue], [ExecutionTime], [ExecutionDuration], [ClientIpAddress], [ClientName], [BrowserInfo], [ExceptionMessage], [Exception], [ImpersonatorUserId], [ImpersonatorTenantId], [CustomData]) VALUES (27, 1, 2, N'Abp.AspNetCore.Mvc.Controllers.AbpUserConfigurationController', N'GetAll', N'{}', NULL, CAST(N'2025-05-06T20:47:05.9587962' AS DateTime2), 5, N'::1', NULL, N'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/135.0.0.0 Safari/537.36', NULL, NULL, NULL, 1, NULL)
GO
INSERT [dbo].[AbpAuditLogs] ([Id], [TenantId], [UserId], [ServiceName], [MethodName], [Parameters], [ReturnValue], [ExecutionTime], [ExecutionDuration], [ClientIpAddress], [ClientName], [BrowserInfo], [ExceptionMessage], [Exception], [ImpersonatorUserId], [ImpersonatorTenantId], [CustomData]) VALUES (28, 1, 2, N'School.LMS.Students.StudentImportService', N'GetAllAsync', N'{"input":{"keyword":null}}', NULL, CAST(N'2025-05-06T20:47:06.3634977' AS DateTime2), 56, N'::1', NULL, N'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/135.0.0.0 Safari/537.36', NULL, NULL, NULL, 1, NULL)
GO
INSERT [dbo].[AbpAuditLogs] ([Id], [TenantId], [UserId], [ServiceName], [MethodName], [Parameters], [ReturnValue], [ExecutionTime], [ExecutionDuration], [ClientIpAddress], [ClientName], [BrowserInfo], [ExceptionMessage], [Exception], [ImpersonatorUserId], [ImpersonatorTenantId], [CustomData]) VALUES (29, 1, 2, N'School.LMS.EducationalFeePlan.EducationFeeService', N'GetAllEducationalFees', N'{}', NULL, CAST(N'2025-05-06T20:47:06.3680158' AS DateTime2), 77, N'::1', NULL, N'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/135.0.0.0 Safari/537.36', NULL, NULL, NULL, 1, NULL)
GO
INSERT [dbo].[AbpAuditLogs] ([Id], [TenantId], [UserId], [ServiceName], [MethodName], [Parameters], [ReturnValue], [ExecutionTime], [ExecutionDuration], [ClientIpAddress], [ClientName], [BrowserInfo], [ExceptionMessage], [Exception], [ImpersonatorUserId], [ImpersonatorTenantId], [CustomData]) VALUES (30, 1, 2, N'School.LMS.EducationalFeePlan.EducationFeeService', N'GetAllEducationalFees', N'{}', NULL, CAST(N'2025-05-06T20:47:06.3629800' AS DateTime2), 83, N'::1', NULL, N'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/135.0.0.0 Safari/537.36', NULL, NULL, NULL, 1, NULL)
GO
INSERT [dbo].[AbpAuditLogs] ([Id], [TenantId], [UserId], [ServiceName], [MethodName], [Parameters], [ReturnValue], [ExecutionTime], [ExecutionDuration], [ClientIpAddress], [ClientName], [BrowserInfo], [ExceptionMessage], [Exception], [ImpersonatorUserId], [ImpersonatorTenantId], [CustomData]) VALUES (31, 1, NULL, N'School.LMS.Web.Host.Controllers.HomeController', N'Index', N'{}', NULL, CAST(N'2025-05-06T20:52:09.9289862' AS DateTime2), 10, N'::1', NULL, N'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/135.0.0.0 Safari/537.36', NULL, NULL, NULL, 1, NULL)
GO
INSERT [dbo].[AbpAuditLogs] ([Id], [TenantId], [UserId], [ServiceName], [MethodName], [Parameters], [ReturnValue], [ExecutionTime], [ExecutionDuration], [ClientIpAddress], [ClientName], [BrowserInfo], [ExceptionMessage], [Exception], [ImpersonatorUserId], [ImpersonatorTenantId], [CustomData]) VALUES (32, 1, 2, N'School.LMS.Web.Host.Controllers.AntiForgeryController', N'SetCookie', N'{}', NULL, CAST(N'2025-05-06T20:52:12.1854541' AS DateTime2), 9, N'::1', NULL, N'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/135.0.0.0 Safari/537.36', NULL, NULL, NULL, 1, NULL)
GO
INSERT [dbo].[AbpAuditLogs] ([Id], [TenantId], [UserId], [ServiceName], [MethodName], [Parameters], [ReturnValue], [ExecutionTime], [ExecutionDuration], [ClientIpAddress], [ClientName], [BrowserInfo], [ExceptionMessage], [Exception], [ImpersonatorUserId], [ImpersonatorTenantId], [CustomData]) VALUES (33, 1, 2, N'Abp.AspNetCore.Mvc.Controllers.AbpUserConfigurationController', N'GetAll', N'{}', NULL, CAST(N'2025-05-06T20:52:17.4808730' AS DateTime2), 491, N'::1', NULL, N'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/135.0.0.0 Safari/537.36', NULL, NULL, NULL, 1, NULL)
GO
INSERT [dbo].[AbpAuditLogs] ([Id], [TenantId], [UserId], [ServiceName], [MethodName], [Parameters], [ReturnValue], [ExecutionTime], [ExecutionDuration], [ClientIpAddress], [ClientName], [BrowserInfo], [ExceptionMessage], [Exception], [ImpersonatorUserId], [ImpersonatorTenantId], [CustomData]) VALUES (34, 1, 2, N'School.LMS.EducationalFeePlan.EducationFeeService', N'GetAllEducationalFees', N'{}', NULL, CAST(N'2025-05-06T20:52:18.3961749' AS DateTime2), 217, N'::1', NULL, N'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/135.0.0.0 Safari/537.36', NULL, NULL, NULL, 1, NULL)
GO
INSERT [dbo].[AbpAuditLogs] ([Id], [TenantId], [UserId], [ServiceName], [MethodName], [Parameters], [ReturnValue], [ExecutionTime], [ExecutionDuration], [ClientIpAddress], [ClientName], [BrowserInfo], [ExceptionMessage], [Exception], [ImpersonatorUserId], [ImpersonatorTenantId], [CustomData]) VALUES (35, 1, 2, N'School.LMS.EducationalFeePlan.EducationFeeService', N'GetAllEducationalFees', N'{}', NULL, CAST(N'2025-05-06T20:52:18.3944122' AS DateTime2), 221, N'::1', NULL, N'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/135.0.0.0 Safari/537.36', NULL, NULL, NULL, 1, NULL)
GO
INSERT [dbo].[AbpAuditLogs] ([Id], [TenantId], [UserId], [ServiceName], [MethodName], [Parameters], [ReturnValue], [ExecutionTime], [ExecutionDuration], [ClientIpAddress], [ClientName], [BrowserInfo], [ExceptionMessage], [Exception], [ImpersonatorUserId], [ImpersonatorTenantId], [CustomData]) VALUES (36, 1, 2, N'School.LMS.Students.StudentImportService', N'GetAllAsync', N'{"input":{"keyword":null}}', NULL, CAST(N'2025-05-06T20:52:18.6451147' AS DateTime2), 576, N'::1', NULL, N'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/135.0.0.0 Safari/537.36', NULL, NULL, NULL, 1, NULL)
GO
INSERT [dbo].[AbpAuditLogs] ([Id], [TenantId], [UserId], [ServiceName], [MethodName], [Parameters], [ReturnValue], [ExecutionTime], [ExecutionDuration], [ClientIpAddress], [ClientName], [BrowserInfo], [ExceptionMessage], [Exception], [ImpersonatorUserId], [ImpersonatorTenantId], [CustomData]) VALUES (37, 1, NULL, N'School.LMS.Web.Host.Controllers.HomeController', N'Index', N'{}', NULL, CAST(N'2025-05-06T21:03:55.6152248' AS DateTime2), 8, N'::1', NULL, N'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/135.0.0.0 Safari/537.36', NULL, NULL, NULL, 1, NULL)
GO
INSERT [dbo].[AbpAuditLogs] ([Id], [TenantId], [UserId], [ServiceName], [MethodName], [Parameters], [ReturnValue], [ExecutionTime], [ExecutionDuration], [ClientIpAddress], [ClientName], [BrowserInfo], [ExceptionMessage], [Exception], [ImpersonatorUserId], [ImpersonatorTenantId], [CustomData]) VALUES (38, 1, 2, N'School.LMS.Web.Host.Controllers.AntiForgeryController', N'SetCookie', N'{}', NULL, CAST(N'2025-05-06T21:03:56.7687103' AS DateTime2), 7, N'::1', NULL, N'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/135.0.0.0 Safari/537.36', NULL, NULL, NULL, 1, NULL)
GO
INSERT [dbo].[AbpAuditLogs] ([Id], [TenantId], [UserId], [ServiceName], [MethodName], [Parameters], [ReturnValue], [ExecutionTime], [ExecutionDuration], [ClientIpAddress], [ClientName], [BrowserInfo], [ExceptionMessage], [Exception], [ImpersonatorUserId], [ImpersonatorTenantId], [CustomData]) VALUES (39, 1, NULL, N'School.LMS.Web.Host.Controllers.HomeController', N'Index', N'{}', NULL, CAST(N'2025-05-06T21:07:16.3810979' AS DateTime2), 7, N'::1', NULL, N'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/135.0.0.0 Safari/537.36', NULL, NULL, NULL, 1, NULL)
GO
INSERT [dbo].[AbpAuditLogs] ([Id], [TenantId], [UserId], [ServiceName], [MethodName], [Parameters], [ReturnValue], [ExecutionTime], [ExecutionDuration], [ClientIpAddress], [ClientName], [BrowserInfo], [ExceptionMessage], [Exception], [ImpersonatorUserId], [ImpersonatorTenantId], [CustomData]) VALUES (40, 1, 2, N'School.LMS.Web.Host.Controllers.AntiForgeryController', N'SetCookie', N'{}', NULL, CAST(N'2025-05-06T21:07:17.4592532' AS DateTime2), 7, N'::1', NULL, N'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/135.0.0.0 Safari/537.36', NULL, NULL, NULL, 1, NULL)
GO
INSERT [dbo].[AbpAuditLogs] ([Id], [TenantId], [UserId], [ServiceName], [MethodName], [Parameters], [ReturnValue], [ExecutionTime], [ExecutionDuration], [ClientIpAddress], [ClientName], [BrowserInfo], [ExceptionMessage], [Exception], [ImpersonatorUserId], [ImpersonatorTenantId], [CustomData]) VALUES (41, 1, 2, N'Abp.AspNetCore.Mvc.Controllers.AbpUserConfigurationController', N'GetAll', N'{}', NULL, CAST(N'2025-05-06T21:07:39.9715789' AS DateTime2), 487, N'::1', NULL, N'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/135.0.0.0 Safari/537.36', NULL, NULL, NULL, 1, NULL)
GO
INSERT [dbo].[AbpAuditLogs] ([Id], [TenantId], [UserId], [ServiceName], [MethodName], [Parameters], [ReturnValue], [ExecutionTime], [ExecutionDuration], [ClientIpAddress], [ClientName], [BrowserInfo], [ExceptionMessage], [Exception], [ImpersonatorUserId], [ImpersonatorTenantId], [CustomData]) VALUES (42, 1, 2, N'School.LMS.EducationalFeePlan.EducationFeeService', N'GetAllEducationalFees', N'{}', NULL, CAST(N'2025-05-06T21:07:40.8459857' AS DateTime2), 278, N'::1', NULL, N'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/135.0.0.0 Safari/537.36', NULL, NULL, NULL, 1, NULL)
GO
INSERT [dbo].[AbpAuditLogs] ([Id], [TenantId], [UserId], [ServiceName], [MethodName], [Parameters], [ReturnValue], [ExecutionTime], [ExecutionDuration], [ClientIpAddress], [ClientName], [BrowserInfo], [ExceptionMessage], [Exception], [ImpersonatorUserId], [ImpersonatorTenantId], [CustomData]) VALUES (43, 1, 2, N'School.LMS.EducationalFeePlan.EducationFeeService', N'GetAllEducationalFees', N'{}', NULL, CAST(N'2025-05-06T21:07:40.8440388' AS DateTime2), 280, N'::1', NULL, N'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/135.0.0.0 Safari/537.36', NULL, NULL, NULL, 1, NULL)
GO
INSERT [dbo].[AbpAuditLogs] ([Id], [TenantId], [UserId], [ServiceName], [MethodName], [Parameters], [ReturnValue], [ExecutionTime], [ExecutionDuration], [ClientIpAddress], [ClientName], [BrowserInfo], [ExceptionMessage], [Exception], [ImpersonatorUserId], [ImpersonatorTenantId], [CustomData]) VALUES (44, 1, 2, N'School.LMS.Students.StudentImportService', N'GetAllAsync', N'{"input":{"keyword":null}}', NULL, CAST(N'2025-05-06T21:07:41.1231930' AS DateTime2), 577, N'::1', NULL, N'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/135.0.0.0 Safari/537.36', NULL, NULL, NULL, 1, NULL)
GO
INSERT [dbo].[AbpAuditLogs] ([Id], [TenantId], [UserId], [ServiceName], [MethodName], [Parameters], [ReturnValue], [ExecutionTime], [ExecutionDuration], [ClientIpAddress], [ClientName], [BrowserInfo], [ExceptionMessage], [Exception], [ImpersonatorUserId], [ImpersonatorTenantId], [CustomData]) VALUES (45, 1, 2, N'School.LMS.Roles.RoleAppService', N'GetAllAsync', N'{"input":{"keyword":null,"skipCount":0,"maxResultCount":10}}', NULL, CAST(N'2025-05-06T21:07:45.5220792' AS DateTime2), 93, N'::1', NULL, N'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/135.0.0.0 Safari/537.36', NULL, NULL, NULL, 1, NULL)
GO
INSERT [dbo].[AbpAuditLogs] ([Id], [TenantId], [UserId], [ServiceName], [MethodName], [Parameters], [ReturnValue], [ExecutionTime], [ExecutionDuration], [ClientIpAddress], [ClientName], [BrowserInfo], [ExceptionMessage], [Exception], [ImpersonatorUserId], [ImpersonatorTenantId], [CustomData]) VALUES (46, 1, 2, N'School.LMS.Users.UserAppService', N'GetAllAsync', N'{"input":{"keyword":null,"isActive":null,"skipCount":0,"maxResultCount":10}}', NULL, CAST(N'2025-05-06T21:07:47.5548798' AS DateTime2), 111, N'::1', NULL, N'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/135.0.0.0 Safari/537.36', NULL, NULL, NULL, 1, NULL)
GO
INSERT [dbo].[AbpAuditLogs] ([Id], [TenantId], [UserId], [ServiceName], [MethodName], [Parameters], [ReturnValue], [ExecutionTime], [ExecutionDuration], [ClientIpAddress], [ClientName], [BrowserInfo], [ExceptionMessage], [Exception], [ImpersonatorUserId], [ImpersonatorTenantId], [CustomData]) VALUES (47, 1, NULL, N'Abp.AspNetCore.Mvc.Controllers.AbpUserConfigurationController', N'GetAll', N'{}', NULL, CAST(N'2025-05-06T21:08:15.9702578' AS DateTime2), 6, N'::1', NULL, N'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/135.0.0.0 Safari/537.36', NULL, NULL, NULL, 1, NULL)
GO
INSERT [dbo].[AbpAuditLogs] ([Id], [TenantId], [UserId], [ServiceName], [MethodName], [Parameters], [ReturnValue], [ExecutionTime], [ExecutionDuration], [ClientIpAddress], [ClientName], [BrowserInfo], [ExceptionMessage], [Exception], [ImpersonatorUserId], [ImpersonatorTenantId], [CustomData]) VALUES (48, 1, NULL, N'School.LMS.Controllers.TokenAuthController', N'Authenticate', N'{"model":{"userNameOrEmailAddress":"01545646456","rememberClient":false}}', NULL, CAST(N'2025-05-06T21:08:23.9132193' AS DateTime2), 344, N'::1', NULL, N'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/135.0.0.0 Safari/537.36', NULL, NULL, NULL, 1, NULL)
GO
INSERT [dbo].[AbpAuditLogs] ([Id], [TenantId], [UserId], [ServiceName], [MethodName], [Parameters], [ReturnValue], [ExecutionTime], [ExecutionDuration], [ClientIpAddress], [ClientName], [BrowserInfo], [ExceptionMessage], [Exception], [ImpersonatorUserId], [ImpersonatorTenantId], [CustomData]) VALUES (49, 1, 3, N'Abp.AspNetCore.Mvc.Controllers.AbpUserConfigurationController', N'GetAll', N'{}', NULL, CAST(N'2025-05-06T21:08:24.8894790' AS DateTime2), 62, N'::1', NULL, N'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/135.0.0.0 Safari/537.36', NULL, NULL, NULL, 1, NULL)
GO
INSERT [dbo].[AbpAuditLogs] ([Id], [TenantId], [UserId], [ServiceName], [MethodName], [Parameters], [ReturnValue], [ExecutionTime], [ExecutionDuration], [ClientIpAddress], [ClientName], [BrowserInfo], [ExceptionMessage], [Exception], [ImpersonatorUserId], [ImpersonatorTenantId], [CustomData]) VALUES (50, 1, 3, N'School.LMS.Students.StudentImportService', N'GetAllAsync', N'{"input":{"keyword":null}}', NULL, CAST(N'2025-05-06T21:08:30.1968259' AS DateTime2), 14, N'::1', NULL, N'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/135.0.0.0 Safari/537.36', NULL, NULL, NULL, 1, NULL)
GO
INSERT [dbo].[AbpAuditLogs] ([Id], [TenantId], [UserId], [ServiceName], [MethodName], [Parameters], [ReturnValue], [ExecutionTime], [ExecutionDuration], [ClientIpAddress], [ClientName], [BrowserInfo], [ExceptionMessage], [Exception], [ImpersonatorUserId], [ImpersonatorTenantId], [CustomData]) VALUES (51, 1, 3, N'School.LMS.StudentEducationalPayment.StudentPaymentAppService', N'GetStudentPaymentDetailsAsync', N'{"studentId":"125"}', NULL, CAST(N'2025-05-06T21:08:32.6811212' AS DateTime2), 100, N'::1', NULL, N'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/135.0.0.0 Safari/537.36', NULL, NULL, NULL, 1, NULL)
GO
INSERT [dbo].[AbpAuditLogs] ([Id], [TenantId], [UserId], [ServiceName], [MethodName], [Parameters], [ReturnValue], [ExecutionTime], [ExecutionDuration], [ClientIpAddress], [ClientName], [BrowserInfo], [ExceptionMessage], [Exception], [ImpersonatorUserId], [ImpersonatorTenantId], [CustomData]) VALUES (52, 1, 3, N'School.LMS.Students.StudentImportService', N'GetAllAsync', N'{"input":{"keyword":null}}', NULL, CAST(N'2025-05-06T21:08:35.2504693' AS DateTime2), 21, N'::1', NULL, N'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/135.0.0.0 Safari/537.36', NULL, NULL, NULL, 1, NULL)
GO
INSERT [dbo].[AbpAuditLogs] ([Id], [TenantId], [UserId], [ServiceName], [MethodName], [Parameters], [ReturnValue], [ExecutionTime], [ExecutionDuration], [ClientIpAddress], [ClientName], [BrowserInfo], [ExceptionMessage], [Exception], [ImpersonatorUserId], [ImpersonatorTenantId], [CustomData]) VALUES (53, 1, 3, N'School.LMS.EducationalFeePlan.EducationFeeService', N'GetAllEducationalFees', N'{}', NULL, CAST(N'2025-05-06T21:08:35.2499559' AS DateTime2), 22, N'::1', NULL, N'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/135.0.0.0 Safari/537.36', NULL, NULL, NULL, 1, NULL)
GO
INSERT [dbo].[AbpAuditLogs] ([Id], [TenantId], [UserId], [ServiceName], [MethodName], [Parameters], [ReturnValue], [ExecutionTime], [ExecutionDuration], [ClientIpAddress], [ClientName], [BrowserInfo], [ExceptionMessage], [Exception], [ImpersonatorUserId], [ImpersonatorTenantId], [CustomData]) VALUES (54, 1, 3, N'School.LMS.EducationalFeePlan.EducationFeeService', N'GetAllEducationalFees', N'{}', NULL, CAST(N'2025-05-06T21:08:35.2555793' AS DateTime2), 55, N'::1', NULL, N'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/135.0.0.0 Safari/537.36', NULL, NULL, NULL, 1, NULL)
GO
INSERT [dbo].[AbpAuditLogs] ([Id], [TenantId], [UserId], [ServiceName], [MethodName], [Parameters], [ReturnValue], [ExecutionTime], [ExecutionDuration], [ClientIpAddress], [ClientName], [BrowserInfo], [ExceptionMessage], [Exception], [ImpersonatorUserId], [ImpersonatorTenantId], [CustomData]) VALUES (55, 1, 3, N'School.LMS.EducationalFeePlan.EducationFeeService', N'GetAllEducationalFees', N'{}', NULL, CAST(N'2025-05-06T21:08:36.8029818' AS DateTime2), 16, N'::1', NULL, N'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/135.0.0.0 Safari/537.36', NULL, NULL, NULL, 1, NULL)
GO
INSERT [dbo].[AbpAuditLogs] ([Id], [TenantId], [UserId], [ServiceName], [MethodName], [Parameters], [ReturnValue], [ExecutionTime], [ExecutionDuration], [ClientIpAddress], [ClientName], [BrowserInfo], [ExceptionMessage], [Exception], [ImpersonatorUserId], [ImpersonatorTenantId], [CustomData]) VALUES (56, 1, 3, N'School.LMS.EducationalFeePlan.EducationFeeService', N'GetAllEducationalFees', N'{}', NULL, CAST(N'2025-05-06T21:08:36.8215375' AS DateTime2), 44, N'::1', NULL, N'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/135.0.0.0 Safari/537.36', NULL, NULL, NULL, 1, NULL)
GO
INSERT [dbo].[AbpAuditLogs] ([Id], [TenantId], [UserId], [ServiceName], [MethodName], [Parameters], [ReturnValue], [ExecutionTime], [ExecutionDuration], [ClientIpAddress], [ClientName], [BrowserInfo], [ExceptionMessage], [Exception], [ImpersonatorUserId], [ImpersonatorTenantId], [CustomData]) VALUES (57, 1, 3, N'School.LMS.Students.StudentImportService', N'GetAllAsync', N'{"input":{"keyword":null}}', NULL, CAST(N'2025-05-06T21:08:36.8173792' AS DateTime2), 48, N'::1', NULL, N'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/135.0.0.0 Safari/537.36', NULL, NULL, NULL, 1, NULL)
GO
INSERT [dbo].[AbpAuditLogs] ([Id], [TenantId], [UserId], [ServiceName], [MethodName], [Parameters], [ReturnValue], [ExecutionTime], [ExecutionDuration], [ClientIpAddress], [ClientName], [BrowserInfo], [ExceptionMessage], [Exception], [ImpersonatorUserId], [ImpersonatorTenantId], [CustomData]) VALUES (58, 1, 3, N'School.LMS.StudentEducationalPayment.StudentPaymentAppService', N'GetStudentPaymentDetailsAsync', N'{"studentId":"125"}', NULL, CAST(N'2025-05-06T21:08:37.6107066' AS DateTime2), 22, N'::1', NULL, N'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/135.0.0.0 Safari/537.36', NULL, NULL, NULL, 1, NULL)
GO
INSERT [dbo].[AbpAuditLogs] ([Id], [TenantId], [UserId], [ServiceName], [MethodName], [Parameters], [ReturnValue], [ExecutionTime], [ExecutionDuration], [ClientIpAddress], [ClientName], [BrowserInfo], [ExceptionMessage], [Exception], [ImpersonatorUserId], [ImpersonatorTenantId], [CustomData]) VALUES (59, 1, 3, N'Abp.AspNetCore.Mvc.Controllers.AbpUserConfigurationController', N'GetAll', N'{}', NULL, CAST(N'2025-05-06T21:10:29.0397588' AS DateTime2), 7, N'::1', NULL, N'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/135.0.0.0 Safari/537.36', NULL, NULL, NULL, 1, NULL)
GO
INSERT [dbo].[AbpAuditLogs] ([Id], [TenantId], [UserId], [ServiceName], [MethodName], [Parameters], [ReturnValue], [ExecutionTime], [ExecutionDuration], [ClientIpAddress], [ClientName], [BrowserInfo], [ExceptionMessage], [Exception], [ImpersonatorUserId], [ImpersonatorTenantId], [CustomData]) VALUES (60, 1, 3, N'School.LMS.StudentEducationalPayment.StudentPaymentAppService', N'GetStudentPaymentDetailsAsync', N'{"studentId":"125"}', NULL, CAST(N'2025-05-06T21:10:29.4591603' AS DateTime2), 63, N'::1', NULL, N'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/135.0.0.0 Safari/537.36', NULL, NULL, NULL, 1, NULL)
GO
INSERT [dbo].[AbpAuditLogs] ([Id], [TenantId], [UserId], [ServiceName], [MethodName], [Parameters], [ReturnValue], [ExecutionTime], [ExecutionDuration], [ClientIpAddress], [ClientName], [BrowserInfo], [ExceptionMessage], [Exception], [ImpersonatorUserId], [ImpersonatorTenantId], [CustomData]) VALUES (61, 1, 3, N'Abp.AspNetCore.Mvc.Controllers.AbpUserConfigurationController', N'GetAll', N'{}', NULL, CAST(N'2025-05-06T21:11:29.7942788' AS DateTime2), 3, N'::1', NULL, N'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/135.0.0.0 Safari/537.36', NULL, NULL, NULL, 1, NULL)
GO
INSERT [dbo].[AbpAuditLogs] ([Id], [TenantId], [UserId], [ServiceName], [MethodName], [Parameters], [ReturnValue], [ExecutionTime], [ExecutionDuration], [ClientIpAddress], [ClientName], [BrowserInfo], [ExceptionMessage], [Exception], [ImpersonatorUserId], [ImpersonatorTenantId], [CustomData]) VALUES (62, 1, 3, N'School.LMS.StudentEducationalPayment.StudentPaymentAppService', N'GetStudentPaymentDetailsAsync', N'{"studentId":"125"}', NULL, CAST(N'2025-05-06T21:11:29.9712209' AS DateTime2), 72, N'::1', NULL, N'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/135.0.0.0 Safari/537.36', NULL, NULL, NULL, 1, NULL)
GO
INSERT [dbo].[AbpAuditLogs] ([Id], [TenantId], [UserId], [ServiceName], [MethodName], [Parameters], [ReturnValue], [ExecutionTime], [ExecutionDuration], [ClientIpAddress], [ClientName], [BrowserInfo], [ExceptionMessage], [Exception], [ImpersonatorUserId], [ImpersonatorTenantId], [CustomData]) VALUES (63, 1, NULL, N'School.LMS.Web.Host.Controllers.HomeController', N'Index', N'{}', NULL, CAST(N'2025-05-06T21:12:42.0283684' AS DateTime2), 8, N'::1', NULL, N'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/135.0.0.0 Safari/537.36', NULL, NULL, NULL, 1, NULL)
GO
INSERT [dbo].[AbpAuditLogs] ([Id], [TenantId], [UserId], [ServiceName], [MethodName], [Parameters], [ReturnValue], [ExecutionTime], [ExecutionDuration], [ClientIpAddress], [ClientName], [BrowserInfo], [ExceptionMessage], [Exception], [ImpersonatorUserId], [ImpersonatorTenantId], [CustomData]) VALUES (64, 1, 3, N'School.LMS.Web.Host.Controllers.AntiForgeryController', N'SetCookie', N'{}', NULL, CAST(N'2025-05-06T21:12:43.1870837' AS DateTime2), 10, N'::1', NULL, N'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/135.0.0.0 Safari/537.36', NULL, NULL, NULL, 1, NULL)
GO
INSERT [dbo].[AbpAuditLogs] ([Id], [TenantId], [UserId], [ServiceName], [MethodName], [Parameters], [ReturnValue], [ExecutionTime], [ExecutionDuration], [ClientIpAddress], [ClientName], [BrowserInfo], [ExceptionMessage], [Exception], [ImpersonatorUserId], [ImpersonatorTenantId], [CustomData]) VALUES (65, 1, 3, N'Abp.AspNetCore.Mvc.Controllers.AbpUserConfigurationController', N'GetAll', N'{}', NULL, CAST(N'2025-05-06T21:12:53.8658033' AS DateTime2), 579, N'::1', NULL, N'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/135.0.0.0 Safari/537.36', NULL, NULL, NULL, 1, NULL)
GO
INSERT [dbo].[AbpAuditLogs] ([Id], [TenantId], [UserId], [ServiceName], [MethodName], [Parameters], [ReturnValue], [ExecutionTime], [ExecutionDuration], [ClientIpAddress], [ClientName], [BrowserInfo], [ExceptionMessage], [Exception], [ImpersonatorUserId], [ImpersonatorTenantId], [CustomData]) VALUES (66, 1, 3, N'School.LMS.StudentEducationalPayment.StudentPaymentAppService', N'GetStudentPaymentDetailsAsync', N'{"studentId":"125"}', NULL, CAST(N'2025-05-06T21:12:54.9127936' AS DateTime2), 198, N'::1', NULL, N'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/135.0.0.0 Safari/537.36', NULL, NULL, NULL, 1, NULL)
GO
INSERT [dbo].[AbpAuditLogs] ([Id], [TenantId], [UserId], [ServiceName], [MethodName], [Parameters], [ReturnValue], [ExecutionTime], [ExecutionDuration], [ClientIpAddress], [ClientName], [BrowserInfo], [ExceptionMessage], [Exception], [ImpersonatorUserId], [ImpersonatorTenantId], [CustomData]) VALUES (67, 1, NULL, N'School.LMS.Web.Host.Controllers.HomeController', N'Index', N'{}', NULL, CAST(N'2025-05-06T22:10:12.2753434' AS DateTime2), 13, N'::1', NULL, N'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/135.0.0.0 Safari/537.36', NULL, NULL, NULL, 1, NULL)
GO
INSERT [dbo].[AbpAuditLogs] ([Id], [TenantId], [UserId], [ServiceName], [MethodName], [Parameters], [ReturnValue], [ExecutionTime], [ExecutionDuration], [ClientIpAddress], [ClientName], [BrowserInfo], [ExceptionMessage], [Exception], [ImpersonatorUserId], [ImpersonatorTenantId], [CustomData]) VALUES (68, 1, 3, N'School.LMS.Web.Host.Controllers.AntiForgeryController', N'SetCookie', N'{}', NULL, CAST(N'2025-05-06T22:10:14.5414928' AS DateTime2), 16, N'::1', NULL, N'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/135.0.0.0 Safari/537.36', NULL, NULL, NULL, 1, NULL)
GO
INSERT [dbo].[AbpAuditLogs] ([Id], [TenantId], [UserId], [ServiceName], [MethodName], [Parameters], [ReturnValue], [ExecutionTime], [ExecutionDuration], [ClientIpAddress], [ClientName], [BrowserInfo], [ExceptionMessage], [Exception], [ImpersonatorUserId], [ImpersonatorTenantId], [CustomData]) VALUES (69, 1, 3, N'Abp.AspNetCore.Mvc.Controllers.AbpUserConfigurationController', N'GetAll', N'{}', NULL, CAST(N'2025-05-06T22:12:03.5392207' AS DateTime2), 1581, N'::1', NULL, N'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/135.0.0.0 Safari/537.36', NULL, NULL, NULL, 1, NULL)
GO
INSERT [dbo].[AbpAuditLogs] ([Id], [TenantId], [UserId], [ServiceName], [MethodName], [Parameters], [ReturnValue], [ExecutionTime], [ExecutionDuration], [ClientIpAddress], [ClientName], [BrowserInfo], [ExceptionMessage], [Exception], [ImpersonatorUserId], [ImpersonatorTenantId], [CustomData]) VALUES (70, 1, 3, N'School.LMS.StudentEducationalPayment.StudentPaymentAppService', N'GetStudentPaymentDetailsAsync', N'{"studentId":"125"}', NULL, CAST(N'2025-05-06T22:12:06.0377147' AS DateTime2), 368, N'::1', NULL, N'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/135.0.0.0 Safari/537.36', NULL, NULL, NULL, 1, NULL)
GO
INSERT [dbo].[AbpAuditLogs] ([Id], [TenantId], [UserId], [ServiceName], [MethodName], [Parameters], [ReturnValue], [ExecutionTime], [ExecutionDuration], [ClientIpAddress], [ClientName], [BrowserInfo], [ExceptionMessage], [Exception], [ImpersonatorUserId], [ImpersonatorTenantId], [CustomData]) VALUES (71, 1, 3, N'Abp.AspNetCore.Mvc.Controllers.AbpUserConfigurationController', N'GetAll', N'{}', NULL, CAST(N'2025-05-06T22:13:41.8949261' AS DateTime2), 11, N'::1', NULL, N'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/135.0.0.0 Safari/537.36', NULL, NULL, NULL, 1, NULL)
GO
INSERT [dbo].[AbpAuditLogs] ([Id], [TenantId], [UserId], [ServiceName], [MethodName], [Parameters], [ReturnValue], [ExecutionTime], [ExecutionDuration], [ClientIpAddress], [ClientName], [BrowserInfo], [ExceptionMessage], [Exception], [ImpersonatorUserId], [ImpersonatorTenantId], [CustomData]) VALUES (72, 1, 3, N'School.LMS.StudentEducationalPayment.StudentPaymentAppService', N'GetStudentPaymentDetailsAsync', N'{"studentId":"125"}', NULL, CAST(N'2025-05-06T22:13:43.0839021' AS DateTime2), 63, N'::1', NULL, N'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/135.0.0.0 Safari/537.36', NULL, NULL, NULL, 1, NULL)
GO
INSERT [dbo].[AbpAuditLogs] ([Id], [TenantId], [UserId], [ServiceName], [MethodName], [Parameters], [ReturnValue], [ExecutionTime], [ExecutionDuration], [ClientIpAddress], [ClientName], [BrowserInfo], [ExceptionMessage], [Exception], [ImpersonatorUserId], [ImpersonatorTenantId], [CustomData]) VALUES (73, 1, 3, N'Abp.AspNetCore.Mvc.Controllers.AbpUserConfigurationController', N'GetAll', N'{}', NULL, CAST(N'2025-05-06T22:17:18.9149979' AS DateTime2), 8, N'::1', NULL, N'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/135.0.0.0 Safari/537.36', NULL, NULL, NULL, 1, NULL)
GO
INSERT [dbo].[AbpAuditLogs] ([Id], [TenantId], [UserId], [ServiceName], [MethodName], [Parameters], [ReturnValue], [ExecutionTime], [ExecutionDuration], [ClientIpAddress], [ClientName], [BrowserInfo], [ExceptionMessage], [Exception], [ImpersonatorUserId], [ImpersonatorTenantId], [CustomData]) VALUES (74, 1, 3, N'School.LMS.StudentEducationalPayment.StudentPaymentAppService', N'GetStudentPaymentDetailsAsync', N'{"studentId":"125"}', NULL, CAST(N'2025-05-06T22:17:19.6414951' AS DateTime2), 85, N'::1', NULL, N'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/135.0.0.0 Safari/537.36', NULL, NULL, NULL, 1, NULL)
GO
INSERT [dbo].[AbpAuditLogs] ([Id], [TenantId], [UserId], [ServiceName], [MethodName], [Parameters], [ReturnValue], [ExecutionTime], [ExecutionDuration], [ClientIpAddress], [ClientName], [BrowserInfo], [ExceptionMessage], [Exception], [ImpersonatorUserId], [ImpersonatorTenantId], [CustomData]) VALUES (75, 1, NULL, N'School.LMS.Web.Host.Controllers.HomeController', N'Index', N'{}', NULL, CAST(N'2025-05-06T22:18:18.4841684' AS DateTime2), 17, N'::1', NULL, N'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/135.0.0.0 Safari/537.36', NULL, NULL, NULL, 1, NULL)
GO
INSERT [dbo].[AbpAuditLogs] ([Id], [TenantId], [UserId], [ServiceName], [MethodName], [Parameters], [ReturnValue], [ExecutionTime], [ExecutionDuration], [ClientIpAddress], [ClientName], [BrowserInfo], [ExceptionMessage], [Exception], [ImpersonatorUserId], [ImpersonatorTenantId], [CustomData]) VALUES (76, 1, 3, N'School.LMS.Web.Host.Controllers.AntiForgeryController', N'SetCookie', N'{}', NULL, CAST(N'2025-05-06T22:18:22.7187025' AS DateTime2), 20, N'::1', NULL, N'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/135.0.0.0 Safari/537.36', NULL, NULL, NULL, 1, NULL)
GO
INSERT [dbo].[AbpAuditLogs] ([Id], [TenantId], [UserId], [ServiceName], [MethodName], [Parameters], [ReturnValue], [ExecutionTime], [ExecutionDuration], [ClientIpAddress], [ClientName], [BrowserInfo], [ExceptionMessage], [Exception], [ImpersonatorUserId], [ImpersonatorTenantId], [CustomData]) VALUES (77, 1, 3, N'Abp.AspNetCore.Mvc.Controllers.AbpUserConfigurationController', N'GetAll', N'{}', NULL, CAST(N'2025-05-06T22:18:43.2658442' AS DateTime2), 975, N'::1', NULL, N'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/135.0.0.0 Safari/537.36', NULL, NULL, NULL, 1, NULL)
GO
INSERT [dbo].[AbpAuditLogs] ([Id], [TenantId], [UserId], [ServiceName], [MethodName], [Parameters], [ReturnValue], [ExecutionTime], [ExecutionDuration], [ClientIpAddress], [ClientName], [BrowserInfo], [ExceptionMessage], [Exception], [ImpersonatorUserId], [ImpersonatorTenantId], [CustomData]) VALUES (78, 1, 3, N'School.LMS.StudentEducationalPayment.StudentPaymentAppService', N'GetStudentPaymentDetailsAsync', N'{"studentId":"125"}', NULL, CAST(N'2025-05-06T22:18:45.0981988' AS DateTime2), 389, N'::1', NULL, N'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/135.0.0.0 Safari/537.36', NULL, NULL, NULL, 1, NULL)
GO
INSERT [dbo].[AbpAuditLogs] ([Id], [TenantId], [UserId], [ServiceName], [MethodName], [Parameters], [ReturnValue], [ExecutionTime], [ExecutionDuration], [ClientIpAddress], [ClientName], [BrowserInfo], [ExceptionMessage], [Exception], [ImpersonatorUserId], [ImpersonatorTenantId], [CustomData]) VALUES (79, 1, NULL, N'School.LMS.Web.Host.Controllers.HomeController', N'Index', N'{}', NULL, CAST(N'2025-05-06T22:20:09.0801735' AS DateTime2), 20, N'::1', NULL, N'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/135.0.0.0 Safari/537.36', NULL, NULL, NULL, 1, NULL)
GO
INSERT [dbo].[AbpAuditLogs] ([Id], [TenantId], [UserId], [ServiceName], [MethodName], [Parameters], [ReturnValue], [ExecutionTime], [ExecutionDuration], [ClientIpAddress], [ClientName], [BrowserInfo], [ExceptionMessage], [Exception], [ImpersonatorUserId], [ImpersonatorTenantId], [CustomData]) VALUES (80, 1, 3, N'School.LMS.Web.Host.Controllers.AntiForgeryController', N'SetCookie', N'{}', NULL, CAST(N'2025-05-06T22:20:10.8084903' AS DateTime2), 14, N'::1', NULL, N'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/135.0.0.0 Safari/537.36', NULL, NULL, NULL, 1, NULL)
GO
INSERT [dbo].[AbpAuditLogs] ([Id], [TenantId], [UserId], [ServiceName], [MethodName], [Parameters], [ReturnValue], [ExecutionTime], [ExecutionDuration], [ClientIpAddress], [ClientName], [BrowserInfo], [ExceptionMessage], [Exception], [ImpersonatorUserId], [ImpersonatorTenantId], [CustomData]) VALUES (81, 1, 3, N'Abp.AspNetCore.Mvc.Controllers.AbpUserConfigurationController', N'GetAll', N'{}', NULL, CAST(N'2025-05-06T22:20:09.3983666' AS DateTime2), 1764, N'::1', NULL, N'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/135.0.0.0 Safari/537.36', NULL, NULL, NULL, 1, NULL)
GO
INSERT [dbo].[AbpAuditLogs] ([Id], [TenantId], [UserId], [ServiceName], [MethodName], [Parameters], [ReturnValue], [ExecutionTime], [ExecutionDuration], [ClientIpAddress], [ClientName], [BrowserInfo], [ExceptionMessage], [Exception], [ImpersonatorUserId], [ImpersonatorTenantId], [CustomData]) VALUES (82, 1, 3, N'School.LMS.StudentEducationalPayment.StudentPaymentAppService', N'GetStudentPaymentDetailsAsync', N'{"studentId":"125"}', NULL, CAST(N'2025-05-06T22:20:12.3348162' AS DateTime2), 326, N'::1', NULL, N'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/135.0.0.0 Safari/537.36', NULL, NULL, NULL, 1, NULL)
GO
INSERT [dbo].[AbpAuditLogs] ([Id], [TenantId], [UserId], [ServiceName], [MethodName], [Parameters], [ReturnValue], [ExecutionTime], [ExecutionDuration], [ClientIpAddress], [ClientName], [BrowserInfo], [ExceptionMessage], [Exception], [ImpersonatorUserId], [ImpersonatorTenantId], [CustomData]) VALUES (83, 1, 3, N'Abp.AspNetCore.Mvc.Controllers.AbpUserConfigurationController', N'GetAll', N'{}', NULL, CAST(N'2025-05-06T22:20:17.3487346' AS DateTime2), 8, N'::1', NULL, N'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/135.0.0.0 Safari/537.36', NULL, NULL, NULL, 1, NULL)
GO
INSERT [dbo].[AbpAuditLogs] ([Id], [TenantId], [UserId], [ServiceName], [MethodName], [Parameters], [ReturnValue], [ExecutionTime], [ExecutionDuration], [ClientIpAddress], [ClientName], [BrowserInfo], [ExceptionMessage], [Exception], [ImpersonatorUserId], [ImpersonatorTenantId], [CustomData]) VALUES (84, 1, 3, N'School.LMS.StudentEducationalPayment.StudentPaymentAppService', N'GetStudentPaymentDetailsAsync', N'{"studentId":"125"}', NULL, CAST(N'2025-05-06T22:20:17.6404138' AS DateTime2), 49, N'::1', NULL, N'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/135.0.0.0 Safari/537.36', NULL, NULL, NULL, 1, NULL)
GO
INSERT [dbo].[AbpAuditLogs] ([Id], [TenantId], [UserId], [ServiceName], [MethodName], [Parameters], [ReturnValue], [ExecutionTime], [ExecutionDuration], [ClientIpAddress], [ClientName], [BrowserInfo], [ExceptionMessage], [Exception], [ImpersonatorUserId], [ImpersonatorTenantId], [CustomData]) VALUES (85, 1, NULL, N'School.LMS.Web.Host.Controllers.HomeController', N'Index', N'{}', NULL, CAST(N'2025-05-06T22:22:27.7160028' AS DateTime2), 9, N'::1', NULL, N'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/135.0.0.0 Safari/537.36', NULL, NULL, NULL, 1, NULL)
GO
INSERT [dbo].[AbpAuditLogs] ([Id], [TenantId], [UserId], [ServiceName], [MethodName], [Parameters], [ReturnValue], [ExecutionTime], [ExecutionDuration], [ClientIpAddress], [ClientName], [BrowserInfo], [ExceptionMessage], [Exception], [ImpersonatorUserId], [ImpersonatorTenantId], [CustomData]) VALUES (86, 1, 3, N'School.LMS.Web.Host.Controllers.AntiForgeryController', N'SetCookie', N'{}', NULL, CAST(N'2025-05-06T22:22:29.2362961' AS DateTime2), 43, N'::1', NULL, N'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/135.0.0.0 Safari/537.36', NULL, NULL, NULL, 1, NULL)
GO
INSERT [dbo].[AbpAuditLogs] ([Id], [TenantId], [UserId], [ServiceName], [MethodName], [Parameters], [ReturnValue], [ExecutionTime], [ExecutionDuration], [ClientIpAddress], [ClientName], [BrowserInfo], [ExceptionMessage], [Exception], [ImpersonatorUserId], [ImpersonatorTenantId], [CustomData]) VALUES (87, 1, 3, N'School.LMS.StudentEducationalPayment.StudentPaymentAppService', N'SubmitEducationalPaymentAsync', N'{"input":{"studentId":125,"isFullPayment":true,"amountPaid":28405.0,"paymentDate":"2025-05-06T22:22:35.795+03:00","selectedInstallmentIds":[],"id":0}}', NULL, CAST(N'2025-05-06T22:22:36.0066526' AS DateTime2), 9731, N'::1', NULL, N'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/135.0.0.0 Safari/537.36', NULL, NULL, NULL, 1, NULL)
GO
INSERT [dbo].[AbpAuditLogs] ([Id], [TenantId], [UserId], [ServiceName], [MethodName], [Parameters], [ReturnValue], [ExecutionTime], [ExecutionDuration], [ClientIpAddress], [ClientName], [BrowserInfo], [ExceptionMessage], [Exception], [ImpersonatorUserId], [ImpersonatorTenantId], [CustomData]) VALUES (88, 1, 3, N'Abp.AspNetCore.Mvc.Controllers.AbpUserConfigurationController', N'GetAll', N'{}', NULL, CAST(N'2025-05-06T22:23:44.8560701' AS DateTime2), 752, N'::1', NULL, N'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/135.0.0.0 Safari/537.36', NULL, NULL, NULL, 1, NULL)
GO
INSERT [dbo].[AbpAuditLogs] ([Id], [TenantId], [UserId], [ServiceName], [MethodName], [Parameters], [ReturnValue], [ExecutionTime], [ExecutionDuration], [ClientIpAddress], [ClientName], [BrowserInfo], [ExceptionMessage], [Exception], [ImpersonatorUserId], [ImpersonatorTenantId], [CustomData]) VALUES (89, 1, 3, N'School.LMS.StudentEducationalPayment.StudentPaymentAppService', N'GetStudentPaymentDetailsAsync', N'{"studentId":"436"}', NULL, CAST(N'2025-05-06T22:23:46.0479210' AS DateTime2), 5115, N'::1', NULL, N'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/135.0.0.0 Safari/537.36', NULL, NULL, NULL, 1, NULL)
GO
INSERT [dbo].[AbpAuditLogs] ([Id], [TenantId], [UserId], [ServiceName], [MethodName], [Parameters], [ReturnValue], [ExecutionTime], [ExecutionDuration], [ClientIpAddress], [ClientName], [BrowserInfo], [ExceptionMessage], [Exception], [ImpersonatorUserId], [ImpersonatorTenantId], [CustomData]) VALUES (90, 1, NULL, N'School.LMS.Web.Host.Controllers.HomeController', N'Index', N'{}', NULL, CAST(N'2025-05-06T22:24:39.2045751' AS DateTime2), 25, N'::1', NULL, N'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/135.0.0.0 Safari/537.36', NULL, NULL, NULL, 1, NULL)
GO
INSERT [dbo].[AbpAuditLogs] ([Id], [TenantId], [UserId], [ServiceName], [MethodName], [Parameters], [ReturnValue], [ExecutionTime], [ExecutionDuration], [ClientIpAddress], [ClientName], [BrowserInfo], [ExceptionMessage], [Exception], [ImpersonatorUserId], [ImpersonatorTenantId], [CustomData]) VALUES (91, 1, 3, N'Abp.AspNetCore.Mvc.Controllers.AbpUserConfigurationController', N'GetAll', N'{}', NULL, CAST(N'2025-05-06T22:24:39.4687308' AS DateTime2), 1336, N'::1', NULL, N'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/135.0.0.0 Safari/537.36', NULL, NULL, NULL, 1, NULL)
GO
INSERT [dbo].[AbpAuditLogs] ([Id], [TenantId], [UserId], [ServiceName], [MethodName], [Parameters], [ReturnValue], [ExecutionTime], [ExecutionDuration], [ClientIpAddress], [ClientName], [BrowserInfo], [ExceptionMessage], [Exception], [ImpersonatorUserId], [ImpersonatorTenantId], [CustomData]) VALUES (92, 1, 3, N'School.LMS.Web.Host.Controllers.AntiForgeryController', N'SetCookie', N'{}', NULL, CAST(N'2025-05-06T22:24:40.8955385' AS DateTime2), 23, N'::1', NULL, N'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/135.0.0.0 Safari/537.36', NULL, NULL, NULL, 1, NULL)
GO
INSERT [dbo].[AbpAuditLogs] ([Id], [TenantId], [UserId], [ServiceName], [MethodName], [Parameters], [ReturnValue], [ExecutionTime], [ExecutionDuration], [ClientIpAddress], [ClientName], [BrowserInfo], [ExceptionMessage], [Exception], [ImpersonatorUserId], [ImpersonatorTenantId], [CustomData]) VALUES (93, 1, 3, N'School.LMS.StudentEducationalPayment.StudentPaymentAppService', N'GetStudentPaymentDetailsAsync', N'{"studentId":"436"}', NULL, CAST(N'2025-05-06T22:24:42.3174163' AS DateTime2), 350, N'::1', NULL, N'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/135.0.0.0 Safari/537.36', NULL, NULL, NULL, 1, NULL)
GO
INSERT [dbo].[AbpAuditLogs] ([Id], [TenantId], [UserId], [ServiceName], [MethodName], [Parameters], [ReturnValue], [ExecutionTime], [ExecutionDuration], [ClientIpAddress], [ClientName], [BrowserInfo], [ExceptionMessage], [Exception], [ImpersonatorUserId], [ImpersonatorTenantId], [CustomData]) VALUES (94, 1, NULL, N'School.LMS.Web.Host.Controllers.HomeController', N'Index', N'{}', NULL, CAST(N'2025-05-06T22:26:13.4818966' AS DateTime2), 10, N'::1', NULL, N'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/135.0.0.0 Safari/537.36', NULL, NULL, NULL, 1, NULL)
GO
INSERT [dbo].[AbpAuditLogs] ([Id], [TenantId], [UserId], [ServiceName], [MethodName], [Parameters], [ReturnValue], [ExecutionTime], [ExecutionDuration], [ClientIpAddress], [ClientName], [BrowserInfo], [ExceptionMessage], [Exception], [ImpersonatorUserId], [ImpersonatorTenantId], [CustomData]) VALUES (95, 1, NULL, N'School.LMS.Web.Host.Controllers.HomeController', N'Index', N'{}', NULL, CAST(N'2025-05-06T22:28:43.1400504' AS DateTime2), 11, N'::1', NULL, N'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/135.0.0.0 Safari/537.36', NULL, NULL, NULL, 1, NULL)
GO
INSERT [dbo].[AbpAuditLogs] ([Id], [TenantId], [UserId], [ServiceName], [MethodName], [Parameters], [ReturnValue], [ExecutionTime], [ExecutionDuration], [ClientIpAddress], [ClientName], [BrowserInfo], [ExceptionMessage], [Exception], [ImpersonatorUserId], [ImpersonatorTenantId], [CustomData]) VALUES (96, 1, 3, N'School.LMS.Web.Host.Controllers.AntiForgeryController', N'SetCookie', N'{}', NULL, CAST(N'2025-05-06T22:28:44.7524844' AS DateTime2), 40, N'::1', NULL, N'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/135.0.0.0 Safari/537.36', NULL, NULL, NULL, 1, NULL)
GO
INSERT [dbo].[AbpAuditLogs] ([Id], [TenantId], [UserId], [ServiceName], [MethodName], [Parameters], [ReturnValue], [ExecutionTime], [ExecutionDuration], [ClientIpAddress], [ClientName], [BrowserInfo], [ExceptionMessage], [Exception], [ImpersonatorUserId], [ImpersonatorTenantId], [CustomData]) VALUES (97, 1, 3, N'School.LMS.Roles.RoleAppService', N'GetAllAsync', N'{"input":{"keyword":null,"skipCount":0,"maxResultCount":10}}', NULL, CAST(N'2025-05-06T22:28:44.2841060' AS DateTime2), 1156, N'::1', NULL, N'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/135.0.0.0 Safari/537.36', NULL, NULL, NULL, 1, NULL)
GO
INSERT [dbo].[AbpAuditLogs] ([Id], [TenantId], [UserId], [ServiceName], [MethodName], [Parameters], [ReturnValue], [ExecutionTime], [ExecutionDuration], [ClientIpAddress], [ClientName], [BrowserInfo], [ExceptionMessage], [Exception], [ImpersonatorUserId], [ImpersonatorTenantId], [CustomData]) VALUES (98, 1, NULL, N'School.LMS.Web.Host.Controllers.HomeController', N'Index', N'{}', NULL, CAST(N'2025-05-06T22:31:34.3143846' AS DateTime2), 16, N'::1', NULL, N'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/135.0.0.0 Safari/537.36', NULL, NULL, NULL, 1, NULL)
GO
INSERT [dbo].[AbpAuditLogs] ([Id], [TenantId], [UserId], [ServiceName], [MethodName], [Parameters], [ReturnValue], [ExecutionTime], [ExecutionDuration], [ClientIpAddress], [ClientName], [BrowserInfo], [ExceptionMessage], [Exception], [ImpersonatorUserId], [ImpersonatorTenantId], [CustomData]) VALUES (99, 1, 3, N'School.LMS.Web.Host.Controllers.AntiForgeryController', N'SetCookie', N'{}', NULL, CAST(N'2025-05-06T22:31:35.6970275' AS DateTime2), 14, N'::1', NULL, N'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/135.0.0.0 Safari/537.36', NULL, NULL, NULL, 1, NULL)
GO
INSERT [dbo].[AbpAuditLogs] ([Id], [TenantId], [UserId], [ServiceName], [MethodName], [Parameters], [ReturnValue], [ExecutionTime], [ExecutionDuration], [ClientIpAddress], [ClientName], [BrowserInfo], [ExceptionMessage], [Exception], [ImpersonatorUserId], [ImpersonatorTenantId], [CustomData]) VALUES (100, 1, 3, N'Abp.AspNetCore.Mvc.Controllers.AbpUserConfigurationController', N'GetAll', N'{}', NULL, CAST(N'2025-05-06T22:32:08.4462392' AS DateTime2), 646, N'::1', NULL, N'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/135.0.0.0 Safari/537.36', NULL, NULL, NULL, 1, NULL)
GO
INSERT [dbo].[AbpAuditLogs] ([Id], [TenantId], [UserId], [ServiceName], [MethodName], [Parameters], [ReturnValue], [ExecutionTime], [ExecutionDuration], [ClientIpAddress], [ClientName], [BrowserInfo], [ExceptionMessage], [Exception], [ImpersonatorUserId], [ImpersonatorTenantId], [CustomData]) VALUES (101, 1, 3, N'School.LMS.StudentEducationalPayment.StudentPaymentAppService', N'GetStudentPaymentDetailsAsync', N'{"studentId":"436"}', NULL, CAST(N'2025-05-06T22:32:09.9833132' AS DateTime2), 35331, N'::1', NULL, N'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/135.0.0.0 Safari/537.36', NULL, NULL, NULL, 1, NULL)
GO
INSERT [dbo].[AbpAuditLogs] ([Id], [TenantId], [UserId], [ServiceName], [MethodName], [Parameters], [ReturnValue], [ExecutionTime], [ExecutionDuration], [ClientIpAddress], [ClientName], [BrowserInfo], [ExceptionMessage], [Exception], [ImpersonatorUserId], [ImpersonatorTenantId], [CustomData]) VALUES (102, 1, 3, N'Abp.AspNetCore.Mvc.Controllers.AbpUserConfigurationController', N'GetAll', N'{}', NULL, CAST(N'2025-05-06T22:32:51.8140384' AS DateTime2), 14, N'::1', NULL, N'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/135.0.0.0 Safari/537.36', NULL, NULL, NULL, 1, NULL)
GO
INSERT [dbo].[AbpAuditLogs] ([Id], [TenantId], [UserId], [ServiceName], [MethodName], [Parameters], [ReturnValue], [ExecutionTime], [ExecutionDuration], [ClientIpAddress], [ClientName], [BrowserInfo], [ExceptionMessage], [Exception], [ImpersonatorUserId], [ImpersonatorTenantId], [CustomData]) VALUES (103, 1, 3, N'School.LMS.StudentEducationalPayment.StudentPaymentAppService', N'GetStudentPaymentDetailsAsync', N'{"studentId":"436"}', NULL, CAST(N'2025-05-06T22:32:52.1400719' AS DateTime2), 4754, N'::1', NULL, N'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/135.0.0.0 Safari/537.36', NULL, NULL, NULL, 1, NULL)
GO
INSERT [dbo].[AbpAuditLogs] ([Id], [TenantId], [UserId], [ServiceName], [MethodName], [Parameters], [ReturnValue], [ExecutionTime], [ExecutionDuration], [ClientIpAddress], [ClientName], [BrowserInfo], [ExceptionMessage], [Exception], [ImpersonatorUserId], [ImpersonatorTenantId], [CustomData]) VALUES (104, 1, NULL, N'School.LMS.Web.Host.Controllers.HomeController', N'Index', N'{}', NULL, CAST(N'2025-05-06T22:34:42.9558435' AS DateTime2), 9, N'::1', NULL, N'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/135.0.0.0 Safari/537.36', NULL, NULL, NULL, 1, NULL)
GO
INSERT [dbo].[AbpAuditLogs] ([Id], [TenantId], [UserId], [ServiceName], [MethodName], [Parameters], [ReturnValue], [ExecutionTime], [ExecutionDuration], [ClientIpAddress], [ClientName], [BrowserInfo], [ExceptionMessage], [Exception], [ImpersonatorUserId], [ImpersonatorTenantId], [CustomData]) VALUES (105, 1, 3, N'School.LMS.Web.Host.Controllers.AntiForgeryController', N'SetCookie', N'{}', NULL, CAST(N'2025-05-06T22:34:43.9053309' AS DateTime2), 13, N'::1', NULL, N'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/135.0.0.0 Safari/537.36', NULL, NULL, NULL, 1, NULL)
GO
INSERT [dbo].[AbpAuditLogs] ([Id], [TenantId], [UserId], [ServiceName], [MethodName], [Parameters], [ReturnValue], [ExecutionTime], [ExecutionDuration], [ClientIpAddress], [ClientName], [BrowserInfo], [ExceptionMessage], [Exception], [ImpersonatorUserId], [ImpersonatorTenantId], [CustomData]) VALUES (106, 1, 3, N'School.LMS.StudentEducationalPayment.StudentPaymentAppService', N'SubmitEducationalPaymentAsync', N'{"input":{"studentId":436,"isFullPayment":false,"amountPaid":18600.0,"paymentDate":"2025-05-06T22:34:51.092+03:00","selectedInstallmentIds":[17,18],"id":0}}', NULL, CAST(N'2025-05-06T22:34:51.3864208' AS DateTime2), 289, N'::1', NULL, N'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/135.0.0.0 Safari/537.36', NULL, NULL, NULL, 1, NULL)
GO
INSERT [dbo].[AbpAuditLogs] ([Id], [TenantId], [UserId], [ServiceName], [MethodName], [Parameters], [ReturnValue], [ExecutionTime], [ExecutionDuration], [ClientIpAddress], [ClientName], [BrowserInfo], [ExceptionMessage], [Exception], [ImpersonatorUserId], [ImpersonatorTenantId], [CustomData]) VALUES (107, 1, 3, N'Abp.AspNetCore.Mvc.Controllers.AbpUserConfigurationController', N'GetAll', N'{}', NULL, CAST(N'2025-05-06T22:34:56.1150257' AS DateTime2), 669, N'::1', NULL, N'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/135.0.0.0 Safari/537.36', NULL, NULL, NULL, 1, NULL)
GO
INSERT [dbo].[AbpAuditLogs] ([Id], [TenantId], [UserId], [ServiceName], [MethodName], [Parameters], [ReturnValue], [ExecutionTime], [ExecutionDuration], [ClientIpAddress], [ClientName], [BrowserInfo], [ExceptionMessage], [Exception], [ImpersonatorUserId], [ImpersonatorTenantId], [CustomData]) VALUES (108, 1, 3, N'School.LMS.StudentEducationalPayment.StudentPaymentAppService', N'GetStudentPaymentDetailsAsync', N'{"studentId":"436"}', NULL, CAST(N'2025-05-06T22:34:57.1761873' AS DateTime2), 343, N'::1', NULL, N'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/135.0.0.0 Safari/537.36', NULL, NULL, NULL, 1, NULL)
GO
INSERT [dbo].[AbpAuditLogs] ([Id], [TenantId], [UserId], [ServiceName], [MethodName], [Parameters], [ReturnValue], [ExecutionTime], [ExecutionDuration], [ClientIpAddress], [ClientName], [BrowserInfo], [ExceptionMessage], [Exception], [ImpersonatorUserId], [ImpersonatorTenantId], [CustomData]) VALUES (109, 1, 3, N'Abp.AspNetCore.Mvc.Controllers.AbpUserConfigurationController', N'GetAll', N'{}', NULL, CAST(N'2025-05-06T22:35:16.8171596' AS DateTime2), 12, N'::1', NULL, N'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/135.0.0.0 Safari/537.36', NULL, NULL, NULL, 1, NULL)
GO
INSERT [dbo].[AbpAuditLogs] ([Id], [TenantId], [UserId], [ServiceName], [MethodName], [Parameters], [ReturnValue], [ExecutionTime], [ExecutionDuration], [ClientIpAddress], [ClientName], [BrowserInfo], [ExceptionMessage], [Exception], [ImpersonatorUserId], [ImpersonatorTenantId], [CustomData]) VALUES (110, 1, 3, N'School.LMS.StudentEducationalPayment.StudentPaymentAppService', N'GetStudentPaymentDetailsAsync', N'{"studentId":"436"}', NULL, CAST(N'2025-05-06T22:35:17.0945273' AS DateTime2), 73, N'::1', NULL, N'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/135.0.0.0 Safari/537.36', NULL, NULL, NULL, 1, NULL)
GO
INSERT [dbo].[AbpAuditLogs] ([Id], [TenantId], [UserId], [ServiceName], [MethodName], [Parameters], [ReturnValue], [ExecutionTime], [ExecutionDuration], [ClientIpAddress], [ClientName], [BrowserInfo], [ExceptionMessage], [Exception], [ImpersonatorUserId], [ImpersonatorTenantId], [CustomData]) VALUES (111, 1, 3, N'Abp.AspNetCore.Mvc.Controllers.AbpUserConfigurationController', N'GetAll', N'{}', NULL, CAST(N'2025-05-06T22:35:37.2943662' AS DateTime2), 8, N'::1', NULL, N'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/135.0.0.0 Safari/537.36', NULL, NULL, NULL, 1, NULL)
GO
INSERT [dbo].[AbpAuditLogs] ([Id], [TenantId], [UserId], [ServiceName], [MethodName], [Parameters], [ReturnValue], [ExecutionTime], [ExecutionDuration], [ClientIpAddress], [ClientName], [BrowserInfo], [ExceptionMessage], [Exception], [ImpersonatorUserId], [ImpersonatorTenantId], [CustomData]) VALUES (112, 1, NULL, N'School.LMS.Web.Host.Controllers.HomeController', N'Index', N'{}', NULL, CAST(N'2025-05-06T22:43:03.2405487' AS DateTime2), 10, N'::1', NULL, N'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/135.0.0.0 Safari/537.36', NULL, NULL, NULL, 1, NULL)
GO
INSERT [dbo].[AbpAuditLogs] ([Id], [TenantId], [UserId], [ServiceName], [MethodName], [Parameters], [ReturnValue], [ExecutionTime], [ExecutionDuration], [ClientIpAddress], [ClientName], [BrowserInfo], [ExceptionMessage], [Exception], [ImpersonatorUserId], [ImpersonatorTenantId], [CustomData]) VALUES (113, 1, 3, N'School.LMS.Web.Host.Controllers.AntiForgeryController', N'SetCookie', N'{}', NULL, CAST(N'2025-05-06T22:43:04.7794168' AS DateTime2), 15, N'::1', NULL, N'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/135.0.0.0 Safari/537.36', NULL, NULL, NULL, 1, NULL)
GO
INSERT [dbo].[AbpAuditLogs] ([Id], [TenantId], [UserId], [ServiceName], [MethodName], [Parameters], [ReturnValue], [ExecutionTime], [ExecutionDuration], [ClientIpAddress], [ClientName], [BrowserInfo], [ExceptionMessage], [Exception], [ImpersonatorUserId], [ImpersonatorTenantId], [CustomData]) VALUES (114, 1, 3, N'Abp.AspNetCore.Mvc.Controllers.AbpUserConfigurationController', N'GetAll', N'{}', NULL, CAST(N'2025-05-06T22:43:12.3937390' AS DateTime2), 863, N'::1', NULL, N'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/135.0.0.0 Safari/537.36', NULL, NULL, NULL, 1, NULL)
GO
INSERT [dbo].[AbpAuditLogs] ([Id], [TenantId], [UserId], [ServiceName], [MethodName], [Parameters], [ReturnValue], [ExecutionTime], [ExecutionDuration], [ClientIpAddress], [ClientName], [BrowserInfo], [ExceptionMessage], [Exception], [ImpersonatorUserId], [ImpersonatorTenantId], [CustomData]) VALUES (115, 1, 3, N'School.LMS.StudentEducationalPayment.StudentPaymentAppService', N'GetStudentPaymentDetailsAsync', N'{"studentId":"436"}', NULL, CAST(N'2025-05-06T22:43:13.9297577' AS DateTime2), 19938, N'::1', NULL, N'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/135.0.0.0 Safari/537.36', N'Sequence contains no matching element', N'System.InvalidOperationException: Sequence contains no matching element
   at System.Linq.ThrowHelper.ThrowNoMatchException()
   at System.Linq.Enumerable.First[TSource](IEnumerable`1 source, Func`2 predicate)
   at School.LMS.StudentEducationalPayment.StudentPaymentAppService.GetStudentPaymentDetailsAsync(String studentId) in D:\Work Personal\SCHOOL\New Biolerplate\School.LMS\9.4.2\aspnet-core\src\School.LMS.Application\StudentEducationalPayment\StudentPaymentAppService.cs:line 104
   at lambda_method1943(Closure, Object)
   at Microsoft.AspNetCore.Mvc.Infrastructure.ActionMethodExecutor.AwaitableObjectResultExecutor.Execute(ActionContext actionContext, IActionResultTypeMapper mapper, ObjectMethodExecutor executor, Object controller, Object[] arguments)
   at Microsoft.AspNetCore.Mvc.Infrastructure.ControllerActionInvoker.<InvokeActionMethodAsync>g__Awaited|12_0(ControllerActionInvoker invoker, ValueTask`1 actionResultValueTask)
   at Microsoft.AspNetCore.Mvc.Infrastructure.ControllerActionInvoker.<InvokeNextActionFilterAsync>g__Awaited|10_0(ControllerActionInvoker invoker, Task lastTask, State next, Scope scope, Object state, Boolean isCompleted)', NULL, 1, NULL)
GO
INSERT [dbo].[AbpAuditLogs] ([Id], [TenantId], [UserId], [ServiceName], [MethodName], [Parameters], [ReturnValue], [ExecutionTime], [ExecutionDuration], [ClientIpAddress], [ClientName], [BrowserInfo], [ExceptionMessage], [Exception], [ImpersonatorUserId], [ImpersonatorTenantId], [CustomData]) VALUES (116, 1, NULL, N'School.LMS.Web.Host.Controllers.HomeController', N'Index', N'{}', NULL, CAST(N'2025-05-06T22:43:50.6772931' AS DateTime2), 11, N'::1', NULL, N'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/135.0.0.0 Safari/537.36', NULL, NULL, NULL, 1, NULL)
GO
INSERT [dbo].[AbpAuditLogs] ([Id], [TenantId], [UserId], [ServiceName], [MethodName], [Parameters], [ReturnValue], [ExecutionTime], [ExecutionDuration], [ClientIpAddress], [ClientName], [BrowserInfo], [ExceptionMessage], [Exception], [ImpersonatorUserId], [ImpersonatorTenantId], [CustomData]) VALUES (117, 1, 3, N'School.LMS.Web.Host.Controllers.AntiForgeryController', N'SetCookie', N'{}', NULL, CAST(N'2025-05-06T22:44:08.3143908' AS DateTime2), 10, N'::1', NULL, N'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/135.0.0.0 Safari/537.36', NULL, NULL, NULL, 1, NULL)
GO
INSERT [dbo].[AbpAuditLogs] ([Id], [TenantId], [UserId], [ServiceName], [MethodName], [Parameters], [ReturnValue], [ExecutionTime], [ExecutionDuration], [ClientIpAddress], [ClientName], [BrowserInfo], [ExceptionMessage], [Exception], [ImpersonatorUserId], [ImpersonatorTenantId], [CustomData]) VALUES (118, 1, NULL, N'School.LMS.Web.Host.Controllers.HomeController', N'Index', N'{}', NULL, CAST(N'2025-05-06T22:45:42.9908076' AS DateTime2), 11, N'::1', NULL, N'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/135.0.0.0 Safari/537.36', NULL, NULL, NULL, 1, NULL)
GO
INSERT [dbo].[AbpAuditLogs] ([Id], [TenantId], [UserId], [ServiceName], [MethodName], [Parameters], [ReturnValue], [ExecutionTime], [ExecutionDuration], [ClientIpAddress], [ClientName], [BrowserInfo], [ExceptionMessage], [Exception], [ImpersonatorUserId], [ImpersonatorTenantId], [CustomData]) VALUES (119, 1, NULL, N'School.LMS.Web.Host.Controllers.HomeController', N'Index', N'{}', NULL, CAST(N'2025-05-06T22:45:42.9948088' AS DateTime2), 10, N'::1', NULL, N'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/135.0.0.0 Safari/537.36', NULL, NULL, NULL, 1, NULL)
GO
INSERT [dbo].[AbpAuditLogs] ([Id], [TenantId], [UserId], [ServiceName], [MethodName], [Parameters], [ReturnValue], [ExecutionTime], [ExecutionDuration], [ClientIpAddress], [ClientName], [BrowserInfo], [ExceptionMessage], [Exception], [ImpersonatorUserId], [ImpersonatorTenantId], [CustomData]) VALUES (120, 1, 3, N'School.LMS.Web.Host.Controllers.AntiForgeryController', N'SetCookie', N'{}', NULL, CAST(N'2025-05-06T22:45:45.3463207' AS DateTime2), 20, N'::1', NULL, N'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/135.0.0.0 Safari/537.36', NULL, NULL, NULL, 1, NULL)
GO
INSERT [dbo].[AbpAuditLogs] ([Id], [TenantId], [UserId], [ServiceName], [MethodName], [Parameters], [ReturnValue], [ExecutionTime], [ExecutionDuration], [ClientIpAddress], [ClientName], [BrowserInfo], [ExceptionMessage], [Exception], [ImpersonatorUserId], [ImpersonatorTenantId], [CustomData]) VALUES (121, 1, 3, N'School.LMS.Roles.RoleAppService', N'GetAllAsync', N'{"input":{"keyword":null,"skipCount":0,"maxResultCount":10}}', NULL, CAST(N'2025-05-06T22:45:44.4991705' AS DateTime2), 1233, N'::1', NULL, N'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/135.0.0.0 Safari/537.36', NULL, NULL, NULL, 1, NULL)
GO
INSERT [dbo].[AbpAuditLogs] ([Id], [TenantId], [UserId], [ServiceName], [MethodName], [Parameters], [ReturnValue], [ExecutionTime], [ExecutionDuration], [ClientIpAddress], [ClientName], [BrowserInfo], [ExceptionMessage], [Exception], [ImpersonatorUserId], [ImpersonatorTenantId], [CustomData]) VALUES (122, 1, NULL, N'School.LMS.Web.Host.Controllers.HomeController', N'Index', N'{}', NULL, CAST(N'2025-05-06T22:46:38.4036086' AS DateTime2), 16, N'::1', NULL, N'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/135.0.0.0 Safari/537.36', NULL, NULL, NULL, 1, NULL)
GO
INSERT [dbo].[AbpAuditLogs] ([Id], [TenantId], [UserId], [ServiceName], [MethodName], [Parameters], [ReturnValue], [ExecutionTime], [ExecutionDuration], [ClientIpAddress], [ClientName], [BrowserInfo], [ExceptionMessage], [Exception], [ImpersonatorUserId], [ImpersonatorTenantId], [CustomData]) VALUES (123, 1, 3, N'School.LMS.Web.Host.Controllers.AntiForgeryController', N'SetCookie', N'{}', NULL, CAST(N'2025-05-06T22:46:40.1910957' AS DateTime2), 16, N'::1', NULL, N'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/135.0.0.0 Safari/537.36', NULL, NULL, NULL, 1, NULL)
GO
INSERT [dbo].[AbpAuditLogs] ([Id], [TenantId], [UserId], [ServiceName], [MethodName], [Parameters], [ReturnValue], [ExecutionTime], [ExecutionDuration], [ClientIpAddress], [ClientName], [BrowserInfo], [ExceptionMessage], [Exception], [ImpersonatorUserId], [ImpersonatorTenantId], [CustomData]) VALUES (124, 1, 3, N'Abp.AspNetCore.Mvc.Controllers.AbpUserConfigurationController', N'GetAll', N'{}', NULL, CAST(N'2025-05-06T22:46:44.2334415' AS DateTime2), 892, N'::1', NULL, N'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/135.0.0.0 Safari/537.36', NULL, NULL, NULL, 1, NULL)
GO
INSERT [dbo].[AbpAuditLogs] ([Id], [TenantId], [UserId], [ServiceName], [MethodName], [Parameters], [ReturnValue], [ExecutionTime], [ExecutionDuration], [ClientIpAddress], [ClientName], [BrowserInfo], [ExceptionMessage], [Exception], [ImpersonatorUserId], [ImpersonatorTenantId], [CustomData]) VALUES (125, 1, 3, N'School.LMS.StudentEducationalPayment.StudentPaymentAppService', N'GetStudentPaymentDetailsAsync', N'{"studentId":"436"}', NULL, CAST(N'2025-05-06T22:46:46.4015502' AS DateTime2), 11663, N'::1', NULL, N'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/135.0.0.0 Safari/537.36', NULL, NULL, NULL, 1, NULL)
GO
INSERT [dbo].[AbpAuditLogs] ([Id], [TenantId], [UserId], [ServiceName], [MethodName], [Parameters], [ReturnValue], [ExecutionTime], [ExecutionDuration], [ClientIpAddress], [ClientName], [BrowserInfo], [ExceptionMessage], [Exception], [ImpersonatorUserId], [ImpersonatorTenantId], [CustomData]) VALUES (126, 1, 3, N'Abp.AspNetCore.Mvc.Controllers.AbpUserConfigurationController', N'GetAll', N'{}', NULL, CAST(N'2025-05-06T22:53:06.1449607' AS DateTime2), 10, N'::1', NULL, N'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/135.0.0.0 Safari/537.36', NULL, NULL, NULL, 1, NULL)
GO
INSERT [dbo].[AbpAuditLogs] ([Id], [TenantId], [UserId], [ServiceName], [MethodName], [Parameters], [ReturnValue], [ExecutionTime], [ExecutionDuration], [ClientIpAddress], [ClientName], [BrowserInfo], [ExceptionMessage], [Exception], [ImpersonatorUserId], [ImpersonatorTenantId], [CustomData]) VALUES (127, 1, 3, N'School.LMS.StudentEducationalPayment.StudentPaymentAppService', N'GetStudentPaymentDetailsAsync', N'{"studentId":"436"}', NULL, CAST(N'2025-05-06T22:53:06.5430430' AS DateTime2), 87, N'::1', NULL, N'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/135.0.0.0 Safari/537.36', NULL, NULL, NULL, 1, NULL)
GO
INSERT [dbo].[AbpAuditLogs] ([Id], [TenantId], [UserId], [ServiceName], [MethodName], [Parameters], [ReturnValue], [ExecutionTime], [ExecutionDuration], [ClientIpAddress], [ClientName], [BrowserInfo], [ExceptionMessage], [Exception], [ImpersonatorUserId], [ImpersonatorTenantId], [CustomData]) VALUES (128, 1, 3, N'Abp.AspNetCore.Mvc.Controllers.AbpUserConfigurationController', N'GetAll', N'{}', NULL, CAST(N'2025-05-06T22:53:26.8355778' AS DateTime2), 8, N'::1', NULL, N'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/135.0.0.0 Safari/537.36', NULL, NULL, NULL, 1, NULL)
GO
INSERT [dbo].[AbpAuditLogs] ([Id], [TenantId], [UserId], [ServiceName], [MethodName], [Parameters], [ReturnValue], [ExecutionTime], [ExecutionDuration], [ClientIpAddress], [ClientName], [BrowserInfo], [ExceptionMessage], [Exception], [ImpersonatorUserId], [ImpersonatorTenantId], [CustomData]) VALUES (129, 1, 3, N'School.LMS.StudentEducationalPayment.StudentPaymentAppService', N'GetStudentPaymentDetailsAsync', N'{"studentId":"436"}', NULL, CAST(N'2025-05-06T22:53:27.0961821' AS DateTime2), 65, N'::1', NULL, N'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/135.0.0.0 Safari/537.36', NULL, NULL, NULL, 1, NULL)
GO
INSERT [dbo].[AbpAuditLogs] ([Id], [TenantId], [UserId], [ServiceName], [MethodName], [Parameters], [ReturnValue], [ExecutionTime], [ExecutionDuration], [ClientIpAddress], [ClientName], [BrowserInfo], [ExceptionMessage], [Exception], [ImpersonatorUserId], [ImpersonatorTenantId], [CustomData]) VALUES (130, 1, 3, N'Abp.AspNetCore.Mvc.Controllers.AbpUserConfigurationController', N'GetAll', N'{}', NULL, CAST(N'2025-05-06T22:54:20.7582943' AS DateTime2), 6, N'::1', NULL, N'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/135.0.0.0 Safari/537.36', NULL, NULL, NULL, 1, NULL)
GO
INSERT [dbo].[AbpAuditLogs] ([Id], [TenantId], [UserId], [ServiceName], [MethodName], [Parameters], [ReturnValue], [ExecutionTime], [ExecutionDuration], [ClientIpAddress], [ClientName], [BrowserInfo], [ExceptionMessage], [Exception], [ImpersonatorUserId], [ImpersonatorTenantId], [CustomData]) VALUES (131, 1, 3, N'Abp.AspNetCore.Mvc.Controllers.AbpUserConfigurationController', N'GetAll', N'{}', NULL, CAST(N'2025-05-06T22:54:44.7431771' AS DateTime2), 33, N'::1', NULL, N'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/135.0.0.0 Safari/537.36', NULL, NULL, NULL, 1, NULL)
GO
INSERT [dbo].[AbpAuditLogs] ([Id], [TenantId], [UserId], [ServiceName], [MethodName], [Parameters], [ReturnValue], [ExecutionTime], [ExecutionDuration], [ClientIpAddress], [ClientName], [BrowserInfo], [ExceptionMessage], [Exception], [ImpersonatorUserId], [ImpersonatorTenantId], [CustomData]) VALUES (132, 1, 3, N'School.LMS.StudentEducationalPayment.StudentPaymentAppService', N'GetStudentPaymentDetailsAsync', N'{"studentId":"123"}', NULL, CAST(N'2025-05-06T22:54:21.6306634' AS DateTime2), 23060, N'::1', NULL, N'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/135.0.0.0 Safari/537.36', N'Student not found', N'Abp.UI.UserFriendlyException: Student not found
   at School.LMS.StudentEducationalPayment.StudentPaymentAppService.GetStudentPaymentDetailsAsync(String studentId) in D:\Work Personal\SCHOOL\New Biolerplate\School.LMS\9.4.2\aspnet-core\src\School.LMS.Application\StudentEducationalPayment\StudentPaymentAppService.cs:line 52
   at lambda_method1948(Closure, Object)
   at Microsoft.AspNetCore.Mvc.Infrastructure.ActionMethodExecutor.AwaitableObjectResultExecutor.Execute(ActionContext actionContext, IActionResultTypeMapper mapper, ObjectMethodExecutor executor, Object controller, Object[] arguments)
   at Microsoft.AspNetCore.Mvc.Infrastructure.ControllerActionInvoker.<InvokeActionMethodAsync>g__Awaited|12_0(ControllerActionInvoker invoker, ValueTask`1 actionResultValueTask)
   at Microsoft.AspNetCore.Mvc.Infrastructure.ControllerActionInvoker.<InvokeNextActionFilterAsync>g__Awaited|10_0(ControllerActionInvoker invoker, Task lastTask, State next, Scope scope, Object state, Boolean isCompleted)

UserFriendlyException.Code:0
UserFriendlyException.Details:', NULL, 1, NULL)
GO
INSERT [dbo].[AbpAuditLogs] ([Id], [TenantId], [UserId], [ServiceName], [MethodName], [Parameters], [ReturnValue], [ExecutionTime], [ExecutionDuration], [ClientIpAddress], [ClientName], [BrowserInfo], [ExceptionMessage], [Exception], [ImpersonatorUserId], [ImpersonatorTenantId], [CustomData]) VALUES (133, 1, 3, N'School.LMS.StudentEducationalPayment.StudentPaymentAppService', N'GetStudentPaymentDetailsAsync', N'{"studentId":"125"}', NULL, CAST(N'2025-05-06T22:54:49.6477228' AS DateTime2), 2527, N'::1', NULL, N'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/135.0.0.0 Safari/537.36', N'Sequence contains no matching element', N'System.InvalidOperationException: Sequence contains no matching element
   at System.Linq.ThrowHelper.ThrowNoMatchException()
   at System.Linq.Enumerable.First[TSource](IEnumerable`1 source, Func`2 predicate)
   at School.LMS.StudentEducationalPayment.StudentPaymentAppService.GetStudentPaymentDetailsAsync(String studentId) in D:\Work Personal\SCHOOL\New Biolerplate\School.LMS\9.4.2\aspnet-core\src\School.LMS.Application\StudentEducationalPayment\StudentPaymentAppService.cs:line 104
   at lambda_method1948(Closure, Object)
   at Microsoft.AspNetCore.Mvc.Infrastructure.ActionMethodExecutor.AwaitableObjectResultExecutor.Execute(ActionContext actionContext, IActionResultTypeMapper mapper, ObjectMethodExecutor executor, Object controller, Object[] arguments)
   at Microsoft.AspNetCore.Mvc.Infrastructure.ControllerActionInvoker.<InvokeActionMethodAsync>g__Awaited|12_0(ControllerActionInvoker invoker, ValueTask`1 actionResultValueTask)
   at Microsoft.AspNetCore.Mvc.Infrastructure.ControllerActionInvoker.<InvokeNextActionFilterAsync>g__Awaited|10_0(ControllerActionInvoker invoker, Task lastTask, State next, Scope scope, Object state, Boolean isCompleted)', NULL, 1, NULL)
GO
INSERT [dbo].[AbpAuditLogs] ([Id], [TenantId], [UserId], [ServiceName], [MethodName], [Parameters], [ReturnValue], [ExecutionTime], [ExecutionDuration], [ClientIpAddress], [ClientName], [BrowserInfo], [ExceptionMessage], [Exception], [ImpersonatorUserId], [ImpersonatorTenantId], [CustomData]) VALUES (134, 1, 3, N'Abp.AspNetCore.Mvc.Controllers.AbpUserConfigurationController', N'GetAll', N'{}', NULL, CAST(N'2025-05-06T22:54:59.0860370' AS DateTime2), 7, N'::1', NULL, N'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/135.0.0.0 Safari/537.36', NULL, NULL, NULL, 1, NULL)
GO
INSERT [dbo].[AbpAuditLogs] ([Id], [TenantId], [UserId], [ServiceName], [MethodName], [Parameters], [ReturnValue], [ExecutionTime], [ExecutionDuration], [ClientIpAddress], [ClientName], [BrowserInfo], [ExceptionMessage], [Exception], [ImpersonatorUserId], [ImpersonatorTenantId], [CustomData]) VALUES (135, 1, NULL, N'School.LMS.Web.Host.Controllers.HomeController', N'Index', N'{}', NULL, CAST(N'2025-05-06T22:55:21.2617007' AS DateTime2), 16, N'::1', NULL, N'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/135.0.0.0 Safari/537.36', NULL, NULL, NULL, 1, NULL)
GO
INSERT [dbo].[AbpAuditLogs] ([Id], [TenantId], [UserId], [ServiceName], [MethodName], [Parameters], [ReturnValue], [ExecutionTime], [ExecutionDuration], [ClientIpAddress], [ClientName], [BrowserInfo], [ExceptionMessage], [Exception], [ImpersonatorUserId], [ImpersonatorTenantId], [CustomData]) VALUES (136, 1, NULL, N'School.LMS.Web.Host.Controllers.HomeController', N'Index', N'{}', NULL, CAST(N'2025-05-06T22:55:50.1687072' AS DateTime2), 12, N'127.0.0.1', NULL, N'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/135.0.0.0 Safari/537.36', NULL, NULL, NULL, 1, NULL)
GO
INSERT [dbo].[AbpAuditLogs] ([Id], [TenantId], [UserId], [ServiceName], [MethodName], [Parameters], [ReturnValue], [ExecutionTime], [ExecutionDuration], [ClientIpAddress], [ClientName], [BrowserInfo], [ExceptionMessage], [Exception], [ImpersonatorUserId], [ImpersonatorTenantId], [CustomData]) VALUES (137, 1, 3, N'School.LMS.Web.Host.Controllers.AntiForgeryController', N'SetCookie', N'{}', NULL, CAST(N'2025-05-06T22:55:50.3638844' AS DateTime2), 12, N'127.0.0.1', NULL, N'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/135.0.0.0 Safari/537.36', NULL, NULL, NULL, 1, NULL)
GO
INSERT [dbo].[AbpAuditLogs] ([Id], [TenantId], [UserId], [ServiceName], [MethodName], [Parameters], [ReturnValue], [ExecutionTime], [ExecutionDuration], [ClientIpAddress], [ClientName], [BrowserInfo], [ExceptionMessage], [Exception], [ImpersonatorUserId], [ImpersonatorTenantId], [CustomData]) VALUES (138, 1, 3, N'School.LMS.Web.Host.Controllers.AntiForgeryController', N'SetCookie', N'{}', NULL, CAST(N'2025-05-06T22:55:51.6339791' AS DateTime2), 2, N'127.0.0.1', NULL, N'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/135.0.0.0 Safari/537.36', NULL, NULL, NULL, 1, NULL)
GO
INSERT [dbo].[AbpAuditLogs] ([Id], [TenantId], [UserId], [ServiceName], [MethodName], [Parameters], [ReturnValue], [ExecutionTime], [ExecutionDuration], [ClientIpAddress], [ClientName], [BrowserInfo], [ExceptionMessage], [Exception], [ImpersonatorUserId], [ImpersonatorTenantId], [CustomData]) VALUES (139, 1, 3, N'Abp.AspNetCore.Mvc.Controllers.AbpUserConfigurationController', N'GetAll', N'{}', NULL, CAST(N'2025-05-06T22:56:09.0303710' AS DateTime2), 582, N'127.0.0.1', NULL, N'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/135.0.0.0 Safari/537.36', NULL, NULL, NULL, 1, NULL)
GO
INSERT [dbo].[AbpAuditLogs] ([Id], [TenantId], [UserId], [ServiceName], [MethodName], [Parameters], [ReturnValue], [ExecutionTime], [ExecutionDuration], [ClientIpAddress], [ClientName], [BrowserInfo], [ExceptionMessage], [Exception], [ImpersonatorUserId], [ImpersonatorTenantId], [CustomData]) VALUES (140, 1, NULL, N'School.LMS.Web.Host.Controllers.HomeController', N'Index', N'{}', NULL, CAST(N'2025-05-06T22:57:12.6376854' AS DateTime2), 11, N'::1', NULL, N'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/135.0.0.0 Safari/537.36', NULL, NULL, NULL, 1, NULL)
GO
INSERT [dbo].[AbpAuditLogs] ([Id], [TenantId], [UserId], [ServiceName], [MethodName], [Parameters], [ReturnValue], [ExecutionTime], [ExecutionDuration], [ClientIpAddress], [ClientName], [BrowserInfo], [ExceptionMessage], [Exception], [ImpersonatorUserId], [ImpersonatorTenantId], [CustomData]) VALUES (141, 1, 3, N'School.LMS.Web.Host.Controllers.AntiForgeryController', N'SetCookie', N'{}', NULL, CAST(N'2025-05-06T22:57:14.0244764' AS DateTime2), 17, N'::1', NULL, N'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/135.0.0.0 Safari/537.36', NULL, NULL, NULL, 1, NULL)
GO
INSERT [dbo].[AbpAuditLogs] ([Id], [TenantId], [UserId], [ServiceName], [MethodName], [Parameters], [ReturnValue], [ExecutionTime], [ExecutionDuration], [ClientIpAddress], [ClientName], [BrowserInfo], [ExceptionMessage], [Exception], [ImpersonatorUserId], [ImpersonatorTenantId], [CustomData]) VALUES (142, 1, 3, N'Abp.AspNetCore.Mvc.Controllers.AbpUserConfigurationController', N'GetAll', N'{}', NULL, CAST(N'2025-05-06T22:57:20.6990897' AS DateTime2), 625, N'::1', NULL, N'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/135.0.0.0 Safari/537.36', NULL, NULL, NULL, 1, NULL)
GO
INSERT [dbo].[AbpAuditLogs] ([Id], [TenantId], [UserId], [ServiceName], [MethodName], [Parameters], [ReturnValue], [ExecutionTime], [ExecutionDuration], [ClientIpAddress], [ClientName], [BrowserInfo], [ExceptionMessage], [Exception], [ImpersonatorUserId], [ImpersonatorTenantId], [CustomData]) VALUES (143, 1, 3, N'School.LMS.StudentEducationalPayment.StudentPaymentAppService', N'GetStudentPaymentDetailsAsync', N'{"studentId":"125"}', NULL, CAST(N'2025-05-06T22:57:22.0794906' AS DateTime2), 2754, N'::1', NULL, N'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/135.0.0.0 Safari/537.36', NULL, NULL, NULL, 1, NULL)
GO
INSERT [dbo].[AbpAuditLogs] ([Id], [TenantId], [UserId], [ServiceName], [MethodName], [Parameters], [ReturnValue], [ExecutionTime], [ExecutionDuration], [ClientIpAddress], [ClientName], [BrowserInfo], [ExceptionMessage], [Exception], [ImpersonatorUserId], [ImpersonatorTenantId], [CustomData]) VALUES (144, 1, NULL, N'School.LMS.Web.Host.Controllers.HomeController', N'Index', N'{}', NULL, CAST(N'2025-05-06T23:01:39.7579141' AS DateTime2), 13, N'::1', NULL, N'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/135.0.0.0 Safari/537.36', NULL, NULL, NULL, 1, NULL)
GO
INSERT [dbo].[AbpAuditLogs] ([Id], [TenantId], [UserId], [ServiceName], [MethodName], [Parameters], [ReturnValue], [ExecutionTime], [ExecutionDuration], [ClientIpAddress], [ClientName], [BrowserInfo], [ExceptionMessage], [Exception], [ImpersonatorUserId], [ImpersonatorTenantId], [CustomData]) VALUES (145, 1, 3, N'School.LMS.Web.Host.Controllers.AntiForgeryController', N'SetCookie', N'{}', NULL, CAST(N'2025-05-06T23:01:42.8920133' AS DateTime2), 16, N'::1', NULL, N'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/135.0.0.0 Safari/537.36', NULL, NULL, NULL, 1, NULL)
GO
INSERT [dbo].[AbpAuditLogs] ([Id], [TenantId], [UserId], [ServiceName], [MethodName], [Parameters], [ReturnValue], [ExecutionTime], [ExecutionDuration], [ClientIpAddress], [ClientName], [BrowserInfo], [ExceptionMessage], [Exception], [ImpersonatorUserId], [ImpersonatorTenantId], [CustomData]) VALUES (146, 1, 3, N'Abp.AspNetCore.Mvc.Controllers.AbpUserConfigurationController', N'GetAll', N'{}', NULL, CAST(N'2025-05-06T23:01:48.0192816' AS DateTime2), 960, N'::1', NULL, N'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/135.0.0.0 Safari/537.36', NULL, NULL, NULL, 1, NULL)
GO
INSERT [dbo].[AbpAuditLogs] ([Id], [TenantId], [UserId], [ServiceName], [MethodName], [Parameters], [ReturnValue], [ExecutionTime], [ExecutionDuration], [ClientIpAddress], [ClientName], [BrowserInfo], [ExceptionMessage], [Exception], [ImpersonatorUserId], [ImpersonatorTenantId], [CustomData]) VALUES (147, 1, 3, N'School.LMS.StudentEducationalPayment.StudentPaymentAppService', N'GetStudentPaymentDetailsAsync', N'{"studentId":"125"}', NULL, CAST(N'2025-05-06T23:01:50.0487285' AS DateTime2), 6053, N'::1', NULL, N'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/135.0.0.0 Safari/537.36', NULL, NULL, NULL, 1, NULL)
GO
INSERT [dbo].[AbpAuditLogs] ([Id], [TenantId], [UserId], [ServiceName], [MethodName], [Parameters], [ReturnValue], [ExecutionTime], [ExecutionDuration], [ClientIpAddress], [ClientName], [BrowserInfo], [ExceptionMessage], [Exception], [ImpersonatorUserId], [ImpersonatorTenantId], [CustomData]) VALUES (148, 1, 3, N'Abp.AspNetCore.Mvc.Controllers.AbpUserConfigurationController', N'GetAll', N'{}', NULL, CAST(N'2025-05-06T23:03:02.7261235' AS DateTime2), 10, N'::1', NULL, N'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/135.0.0.0 Safari/537.36', NULL, NULL, NULL, 1, NULL)
GO
INSERT [dbo].[AbpAuditLogs] ([Id], [TenantId], [UserId], [ServiceName], [MethodName], [Parameters], [ReturnValue], [ExecutionTime], [ExecutionDuration], [ClientIpAddress], [ClientName], [BrowserInfo], [ExceptionMessage], [Exception], [ImpersonatorUserId], [ImpersonatorTenantId], [CustomData]) VALUES (149, 1, 3, N'School.LMS.StudentEducationalPayment.StudentPaymentAppService', N'GetStudentPaymentDetailsAsync', N'{"studentId":"125"}', NULL, CAST(N'2025-05-06T23:03:03.3155582' AS DateTime2), 46925, N'::1', NULL, N'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/135.0.0.0 Safari/537.36', NULL, NULL, NULL, 1, NULL)
GO
INSERT [dbo].[AbpAuditLogs] ([Id], [TenantId], [UserId], [ServiceName], [MethodName], [Parameters], [ReturnValue], [ExecutionTime], [ExecutionDuration], [ClientIpAddress], [ClientName], [BrowserInfo], [ExceptionMessage], [Exception], [ImpersonatorUserId], [ImpersonatorTenantId], [CustomData]) VALUES (150, 1, 3, N'Abp.AspNetCore.Mvc.Controllers.AbpUserConfigurationController', N'GetAll', N'{}', NULL, CAST(N'2025-05-06T23:04:49.4591282' AS DateTime2), 12, N'::1', NULL, N'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/135.0.0.0 Safari/537.36', NULL, NULL, NULL, 1, NULL)
GO
INSERT [dbo].[AbpAuditLogs] ([Id], [TenantId], [UserId], [ServiceName], [MethodName], [Parameters], [ReturnValue], [ExecutionTime], [ExecutionDuration], [ClientIpAddress], [ClientName], [BrowserInfo], [ExceptionMessage], [Exception], [ImpersonatorUserId], [ImpersonatorTenantId], [CustomData]) VALUES (151, 1, 3, N'School.LMS.StudentEducationalPayment.StudentPaymentAppService', N'GetStudentPaymentDetailsAsync', N'{"studentId":"125"}', NULL, CAST(N'2025-05-06T23:04:50.0712909' AS DateTime2), 2943, N'::1', NULL, N'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/135.0.0.0 Safari/537.36', NULL, NULL, NULL, 1, NULL)
GO
INSERT [dbo].[AbpAuditLogs] ([Id], [TenantId], [UserId], [ServiceName], [MethodName], [Parameters], [ReturnValue], [ExecutionTime], [ExecutionDuration], [ClientIpAddress], [ClientName], [BrowserInfo], [ExceptionMessage], [Exception], [ImpersonatorUserId], [ImpersonatorTenantId], [CustomData]) VALUES (152, 1, 3, N'Abp.AspNetCore.Mvc.Controllers.AbpUserConfigurationController', N'GetAll', N'{}', NULL, CAST(N'2025-05-06T23:05:04.0866085' AS DateTime2), 7, N'::1', NULL, N'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/135.0.0.0 Safari/537.36', NULL, NULL, NULL, 1, NULL)
GO
INSERT [dbo].[AbpAuditLogs] ([Id], [TenantId], [UserId], [ServiceName], [MethodName], [Parameters], [ReturnValue], [ExecutionTime], [ExecutionDuration], [ClientIpAddress], [ClientName], [BrowserInfo], [ExceptionMessage], [Exception], [ImpersonatorUserId], [ImpersonatorTenantId], [CustomData]) VALUES (153, 1, 3, N'School.LMS.StudentEducationalPayment.StudentPaymentAppService', N'GetStudentPaymentDetailsAsync', N'{"studentId":"125"}', NULL, CAST(N'2025-05-06T23:05:04.9052640' AS DateTime2), 41, N'::1', NULL, N'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/135.0.0.0 Safari/537.36', NULL, NULL, NULL, 1, NULL)
GO
INSERT [dbo].[AbpAuditLogs] ([Id], [TenantId], [UserId], [ServiceName], [MethodName], [Parameters], [ReturnValue], [ExecutionTime], [ExecutionDuration], [ClientIpAddress], [ClientName], [BrowserInfo], [ExceptionMessage], [Exception], [ImpersonatorUserId], [ImpersonatorTenantId], [CustomData]) VALUES (154, 1, 3, N'Abp.AspNetCore.Mvc.Controllers.AbpUserConfigurationController', N'GetAll', N'{}', NULL, CAST(N'2025-05-06T23:06:11.5456215' AS DateTime2), 7, N'::1', NULL, N'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/135.0.0.0 Safari/537.36', NULL, NULL, NULL, 1, NULL)
GO
INSERT [dbo].[AbpAuditLogs] ([Id], [TenantId], [UserId], [ServiceName], [MethodName], [Parameters], [ReturnValue], [ExecutionTime], [ExecutionDuration], [ClientIpAddress], [ClientName], [BrowserInfo], [ExceptionMessage], [Exception], [ImpersonatorUserId], [ImpersonatorTenantId], [CustomData]) VALUES (155, 1, 3, N'School.LMS.StudentEducationalPayment.StudentPaymentAppService', N'GetStudentPaymentDetailsAsync', N'{"studentId":"125"}', NULL, CAST(N'2025-05-06T23:06:12.3631232' AS DateTime2), 54, N'::1', NULL, N'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/135.0.0.0 Safari/537.36', NULL, NULL, NULL, 1, NULL)
GO
INSERT [dbo].[AbpAuditLogs] ([Id], [TenantId], [UserId], [ServiceName], [MethodName], [Parameters], [ReturnValue], [ExecutionTime], [ExecutionDuration], [ClientIpAddress], [ClientName], [BrowserInfo], [ExceptionMessage], [Exception], [ImpersonatorUserId], [ImpersonatorTenantId], [CustomData]) VALUES (156, 1, 3, N'Abp.AspNetCore.Mvc.Controllers.AbpUserConfigurationController', N'GetAll', N'{}', NULL, CAST(N'2025-05-06T23:10:11.0038670' AS DateTime2), 10, N'::1', NULL, N'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/135.0.0.0 Safari/537.36', NULL, NULL, NULL, 1, NULL)
GO
INSERT [dbo].[AbpAuditLogs] ([Id], [TenantId], [UserId], [ServiceName], [MethodName], [Parameters], [ReturnValue], [ExecutionTime], [ExecutionDuration], [ClientIpAddress], [ClientName], [BrowserInfo], [ExceptionMessage], [Exception], [ImpersonatorUserId], [ImpersonatorTenantId], [CustomData]) VALUES (157, 1, 3, N'School.LMS.StudentEducationalPayment.StudentPaymentAppService', N'GetStudentPaymentDetailsAsync', N'{"studentId":"125"}', NULL, CAST(N'2025-05-06T23:10:12.1317325' AS DateTime2), 53, N'::1', NULL, N'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/135.0.0.0 Safari/537.36', NULL, NULL, NULL, 1, NULL)
GO
INSERT [dbo].[AbpAuditLogs] ([Id], [TenantId], [UserId], [ServiceName], [MethodName], [Parameters], [ReturnValue], [ExecutionTime], [ExecutionDuration], [ClientIpAddress], [ClientName], [BrowserInfo], [ExceptionMessage], [Exception], [ImpersonatorUserId], [ImpersonatorTenantId], [CustomData]) VALUES (158, 1, 3, N'Abp.AspNetCore.Mvc.Controllers.AbpUserConfigurationController', N'GetAll', N'{}', NULL, CAST(N'2025-05-06T23:11:02.9222392' AS DateTime2), 5, N'::1', NULL, N'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/135.0.0.0 Safari/537.36', NULL, NULL, NULL, 1, NULL)
GO
INSERT [dbo].[AbpAuditLogs] ([Id], [TenantId], [UserId], [ServiceName], [MethodName], [Parameters], [ReturnValue], [ExecutionTime], [ExecutionDuration], [ClientIpAddress], [ClientName], [BrowserInfo], [ExceptionMessage], [Exception], [ImpersonatorUserId], [ImpersonatorTenantId], [CustomData]) VALUES (159, 1, 3, N'School.LMS.StudentEducationalPayment.StudentPaymentAppService', N'GetStudentPaymentDetailsAsync', N'{"studentId":"125"}', NULL, CAST(N'2025-05-06T23:11:03.3208146' AS DateTime2), 111, N'::1', NULL, N'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/135.0.0.0 Safari/537.36', NULL, NULL, NULL, 1, NULL)
GO
INSERT [dbo].[AbpAuditLogs] ([Id], [TenantId], [UserId], [ServiceName], [MethodName], [Parameters], [ReturnValue], [ExecutionTime], [ExecutionDuration], [ClientIpAddress], [ClientName], [BrowserInfo], [ExceptionMessage], [Exception], [ImpersonatorUserId], [ImpersonatorTenantId], [CustomData]) VALUES (160, 1, 3, N'Abp.AspNetCore.Mvc.Controllers.AbpUserConfigurationController', N'GetAll', N'{}', NULL, CAST(N'2025-05-06T23:11:11.6927866' AS DateTime2), 4, N'::1', NULL, N'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/135.0.0.0 Safari/537.36', NULL, NULL, NULL, 1, NULL)
GO
INSERT [dbo].[AbpAuditLogs] ([Id], [TenantId], [UserId], [ServiceName], [MethodName], [Parameters], [ReturnValue], [ExecutionTime], [ExecutionDuration], [ClientIpAddress], [ClientName], [BrowserInfo], [ExceptionMessage], [Exception], [ImpersonatorUserId], [ImpersonatorTenantId], [CustomData]) VALUES (161, 1, 3, N'School.LMS.StudentEducationalPayment.StudentPaymentAppService', N'GetStudentPaymentDetailsAsync', N'{"studentId":"125"}', NULL, CAST(N'2025-05-06T23:11:12.0812579' AS DateTime2), 27, N'::1', NULL, N'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/135.0.0.0 Safari/537.36', NULL, NULL, NULL, 1, NULL)
GO
INSERT [dbo].[AbpAuditLogs] ([Id], [TenantId], [UserId], [ServiceName], [MethodName], [Parameters], [ReturnValue], [ExecutionTime], [ExecutionDuration], [ClientIpAddress], [ClientName], [BrowserInfo], [ExceptionMessage], [Exception], [ImpersonatorUserId], [ImpersonatorTenantId], [CustomData]) VALUES (162, 1, 3, N'Abp.AspNetCore.Mvc.Controllers.AbpUserConfigurationController', N'GetAll', N'{}', NULL, CAST(N'2025-05-06T23:12:09.8431421' AS DateTime2), 6, N'::1', NULL, N'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/135.0.0.0 Safari/537.36', NULL, NULL, NULL, 1, NULL)
GO
INSERT [dbo].[AbpAuditLogs] ([Id], [TenantId], [UserId], [ServiceName], [MethodName], [Parameters], [ReturnValue], [ExecutionTime], [ExecutionDuration], [ClientIpAddress], [ClientName], [BrowserInfo], [ExceptionMessage], [Exception], [ImpersonatorUserId], [ImpersonatorTenantId], [CustomData]) VALUES (163, 1, 3, N'School.LMS.StudentEducationalPayment.StudentPaymentAppService', N'GetStudentPaymentDetailsAsync', N'{"studentId":"125"}', NULL, CAST(N'2025-05-06T23:12:10.1159277' AS DateTime2), 55, N'::1', NULL, N'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/135.0.0.0 Safari/537.36', NULL, NULL, NULL, 1, NULL)
GO
INSERT [dbo].[AbpAuditLogs] ([Id], [TenantId], [UserId], [ServiceName], [MethodName], [Parameters], [ReturnValue], [ExecutionTime], [ExecutionDuration], [ClientIpAddress], [ClientName], [BrowserInfo], [ExceptionMessage], [Exception], [ImpersonatorUserId], [ImpersonatorTenantId], [CustomData]) VALUES (164, 1, 3, N'Abp.AspNetCore.Mvc.Controllers.AbpUserConfigurationController', N'GetAll', N'{}', NULL, CAST(N'2025-05-06T23:12:32.0293127' AS DateTime2), 4, N'::1', NULL, N'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/135.0.0.0 Safari/537.36', NULL, NULL, NULL, 1, NULL)
GO
INSERT [dbo].[AbpAuditLogs] ([Id], [TenantId], [UserId], [ServiceName], [MethodName], [Parameters], [ReturnValue], [ExecutionTime], [ExecutionDuration], [ClientIpAddress], [ClientName], [BrowserInfo], [ExceptionMessage], [Exception], [ImpersonatorUserId], [ImpersonatorTenantId], [CustomData]) VALUES (165, 1, 3, N'School.LMS.StudentEducationalPayment.StudentPaymentAppService', N'GetStudentPaymentDetailsAsync', N'{"studentId":"125"}', NULL, CAST(N'2025-05-06T23:12:32.2420816' AS DateTime2), 26, N'::1', NULL, N'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/135.0.0.0 Safari/537.36', NULL, NULL, NULL, 1, NULL)
GO
INSERT [dbo].[AbpAuditLogs] ([Id], [TenantId], [UserId], [ServiceName], [MethodName], [Parameters], [ReturnValue], [ExecutionTime], [ExecutionDuration], [ClientIpAddress], [ClientName], [BrowserInfo], [ExceptionMessage], [Exception], [ImpersonatorUserId], [ImpersonatorTenantId], [CustomData]) VALUES (166, 1, 3, N'Abp.AspNetCore.Mvc.Controllers.AbpUserConfigurationController', N'GetAll', N'{}', NULL, CAST(N'2025-05-06T23:13:04.9197350' AS DateTime2), 3, N'::1', NULL, N'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/135.0.0.0 Safari/537.36', NULL, NULL, NULL, 1, NULL)
GO
INSERT [dbo].[AbpAuditLogs] ([Id], [TenantId], [UserId], [ServiceName], [MethodName], [Parameters], [ReturnValue], [ExecutionTime], [ExecutionDuration], [ClientIpAddress], [ClientName], [BrowserInfo], [ExceptionMessage], [Exception], [ImpersonatorUserId], [ImpersonatorTenantId], [CustomData]) VALUES (167, 1, 3, N'School.LMS.StudentEducationalPayment.StudentPaymentAppService', N'GetStudentPaymentDetailsAsync', N'{"studentId":"436"}', NULL, CAST(N'2025-05-06T23:13:05.1066887' AS DateTime2), 114, N'::1', NULL, N'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/135.0.0.0 Safari/537.36', NULL, NULL, NULL, 1, NULL)
GO
INSERT [dbo].[AbpAuditLogs] ([Id], [TenantId], [UserId], [ServiceName], [MethodName], [Parameters], [ReturnValue], [ExecutionTime], [ExecutionDuration], [ClientIpAddress], [ClientName], [BrowserInfo], [ExceptionMessage], [Exception], [ImpersonatorUserId], [ImpersonatorTenantId], [CustomData]) VALUES (168, 1, 3, N'Abp.AspNetCore.Mvc.Controllers.AbpUserConfigurationController', N'GetAll', N'{}', NULL, CAST(N'2025-05-06T23:15:13.1291601' AS DateTime2), 4, N'::1', NULL, N'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/135.0.0.0 Safari/537.36', NULL, NULL, NULL, 1, NULL)
GO
INSERT [dbo].[AbpAuditLogs] ([Id], [TenantId], [UserId], [ServiceName], [MethodName], [Parameters], [ReturnValue], [ExecutionTime], [ExecutionDuration], [ClientIpAddress], [ClientName], [BrowserInfo], [ExceptionMessage], [Exception], [ImpersonatorUserId], [ImpersonatorTenantId], [CustomData]) VALUES (169, 1, 3, N'School.LMS.StudentEducationalPayment.StudentPaymentAppService', N'GetStudentPaymentDetailsAsync', N'{"studentId":"436"}', NULL, CAST(N'2025-05-06T23:15:13.3337731' AS DateTime2), 83, N'::1', NULL, N'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/135.0.0.0 Safari/537.36', NULL, NULL, NULL, 1, NULL)
GO
INSERT [dbo].[AbpAuditLogs] ([Id], [TenantId], [UserId], [ServiceName], [MethodName], [Parameters], [ReturnValue], [ExecutionTime], [ExecutionDuration], [ClientIpAddress], [ClientName], [BrowserInfo], [ExceptionMessage], [Exception], [ImpersonatorUserId], [ImpersonatorTenantId], [CustomData]) VALUES (170, 1, 3, N'Abp.AspNetCore.Mvc.Controllers.AbpUserConfigurationController', N'GetAll', N'{}', NULL, CAST(N'2025-05-06T23:18:35.3697130' AS DateTime2), 5, N'::1', NULL, N'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/135.0.0.0 Safari/537.36', NULL, NULL, NULL, 1, NULL)
GO
INSERT [dbo].[AbpAuditLogs] ([Id], [TenantId], [UserId], [ServiceName], [MethodName], [Parameters], [ReturnValue], [ExecutionTime], [ExecutionDuration], [ClientIpAddress], [ClientName], [BrowserInfo], [ExceptionMessage], [Exception], [ImpersonatorUserId], [ImpersonatorTenantId], [CustomData]) VALUES (171, 1, 3, N'School.LMS.StudentEducationalPayment.StudentPaymentAppService', N'GetStudentPaymentDetailsAsync', N'{"studentId":"436"}', NULL, CAST(N'2025-05-06T23:18:35.6611003' AS DateTime2), 51, N'::1', NULL, N'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/135.0.0.0 Safari/537.36', NULL, NULL, NULL, 1, NULL)
GO
INSERT [dbo].[AbpAuditLogs] ([Id], [TenantId], [UserId], [ServiceName], [MethodName], [Parameters], [ReturnValue], [ExecutionTime], [ExecutionDuration], [ClientIpAddress], [ClientName], [BrowserInfo], [ExceptionMessage], [Exception], [ImpersonatorUserId], [ImpersonatorTenantId], [CustomData]) VALUES (172, 1, 3, N'Abp.AspNetCore.Mvc.Controllers.AbpUserConfigurationController', N'GetAll', N'{}', NULL, CAST(N'2025-05-06T23:19:18.1135691' AS DateTime2), 5, N'::1', NULL, N'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/135.0.0.0 Safari/537.36', NULL, NULL, NULL, 1, NULL)
GO
INSERT [dbo].[AbpAuditLogs] ([Id], [TenantId], [UserId], [ServiceName], [MethodName], [Parameters], [ReturnValue], [ExecutionTime], [ExecutionDuration], [ClientIpAddress], [ClientName], [BrowserInfo], [ExceptionMessage], [Exception], [ImpersonatorUserId], [ImpersonatorTenantId], [CustomData]) VALUES (173, 1, 3, N'School.LMS.StudentEducationalPayment.StudentPaymentAppService', N'GetStudentPaymentDetailsAsync', N'{"studentId":"436"}', NULL, CAST(N'2025-05-06T23:19:18.3194014' AS DateTime2), 91, N'::1', NULL, N'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/135.0.0.0 Safari/537.36', NULL, NULL, NULL, 1, NULL)
GO
INSERT [dbo].[AbpAuditLogs] ([Id], [TenantId], [UserId], [ServiceName], [MethodName], [Parameters], [ReturnValue], [ExecutionTime], [ExecutionDuration], [ClientIpAddress], [ClientName], [BrowserInfo], [ExceptionMessage], [Exception], [ImpersonatorUserId], [ImpersonatorTenantId], [CustomData]) VALUES (174, 1, 3, N'Abp.AspNetCore.Mvc.Controllers.AbpUserConfigurationController', N'GetAll', N'{}', NULL, CAST(N'2025-05-06T23:19:39.3632390' AS DateTime2), 5, N'::1', NULL, N'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/135.0.0.0 Safari/537.36', NULL, NULL, NULL, 1, NULL)
GO
INSERT [dbo].[AbpAuditLogs] ([Id], [TenantId], [UserId], [ServiceName], [MethodName], [Parameters], [ReturnValue], [ExecutionTime], [ExecutionDuration], [ClientIpAddress], [ClientName], [BrowserInfo], [ExceptionMessage], [Exception], [ImpersonatorUserId], [ImpersonatorTenantId], [CustomData]) VALUES (175, 1, 3, N'School.LMS.StudentEducationalPayment.StudentPaymentAppService', N'GetStudentPaymentDetailsAsync', N'{"studentId":"436"}', NULL, CAST(N'2025-05-06T23:19:39.6221304' AS DateTime2), 139, N'::1', NULL, N'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/135.0.0.0 Safari/537.36', NULL, NULL, NULL, 1, NULL)
GO
INSERT [dbo].[AbpAuditLogs] ([Id], [TenantId], [UserId], [ServiceName], [MethodName], [Parameters], [ReturnValue], [ExecutionTime], [ExecutionDuration], [ClientIpAddress], [ClientName], [BrowserInfo], [ExceptionMessage], [Exception], [ImpersonatorUserId], [ImpersonatorTenantId], [CustomData]) VALUES (176, 1, 3, N'Abp.AspNetCore.Mvc.Controllers.AbpUserConfigurationController', N'GetAll', N'{}', NULL, CAST(N'2025-05-06T23:20:15.4884408' AS DateTime2), 3, N'::1', NULL, N'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/135.0.0.0 Safari/537.36', NULL, NULL, NULL, 1, NULL)
GO
INSERT [dbo].[AbpAuditLogs] ([Id], [TenantId], [UserId], [ServiceName], [MethodName], [Parameters], [ReturnValue], [ExecutionTime], [ExecutionDuration], [ClientIpAddress], [ClientName], [BrowserInfo], [ExceptionMessage], [Exception], [ImpersonatorUserId], [ImpersonatorTenantId], [CustomData]) VALUES (177, 1, 3, N'School.LMS.StudentEducationalPayment.StudentPaymentAppService', N'GetStudentPaymentDetailsAsync', N'{"studentId":"436"}', NULL, CAST(N'2025-05-06T23:20:15.6911379' AS DateTime2), 26, N'::1', NULL, N'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/135.0.0.0 Safari/537.36', NULL, NULL, NULL, 1, NULL)
GO
INSERT [dbo].[AbpAuditLogs] ([Id], [TenantId], [UserId], [ServiceName], [MethodName], [Parameters], [ReturnValue], [ExecutionTime], [ExecutionDuration], [ClientIpAddress], [ClientName], [BrowserInfo], [ExceptionMessage], [Exception], [ImpersonatorUserId], [ImpersonatorTenantId], [CustomData]) VALUES (178, 1, 3, N'Abp.AspNetCore.Mvc.Controllers.AbpUserConfigurationController', N'GetAll', N'{}', NULL, CAST(N'2025-05-06T23:20:21.3359094' AS DateTime2), 7, N'::1', NULL, N'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/135.0.0.0 Safari/537.36', NULL, NULL, NULL, 1, NULL)
GO
INSERT [dbo].[AbpAuditLogs] ([Id], [TenantId], [UserId], [ServiceName], [MethodName], [Parameters], [ReturnValue], [ExecutionTime], [ExecutionDuration], [ClientIpAddress], [ClientName], [BrowserInfo], [ExceptionMessage], [Exception], [ImpersonatorUserId], [ImpersonatorTenantId], [CustomData]) VALUES (179, 1, 3, N'School.LMS.StudentEducationalPayment.StudentPaymentAppService', N'GetStudentPaymentDetailsAsync', N'{"studentId":"436"}', NULL, CAST(N'2025-05-06T23:20:21.6004323' AS DateTime2), 84, N'::1', NULL, N'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/135.0.0.0 Safari/537.36', NULL, NULL, NULL, 1, NULL)
GO
INSERT [dbo].[AbpAuditLogs] ([Id], [TenantId], [UserId], [ServiceName], [MethodName], [Parameters], [ReturnValue], [ExecutionTime], [ExecutionDuration], [ClientIpAddress], [ClientName], [BrowserInfo], [ExceptionMessage], [Exception], [ImpersonatorUserId], [ImpersonatorTenantId], [CustomData]) VALUES (180, 1, 3, N'Abp.AspNetCore.Mvc.Controllers.AbpUserConfigurationController', N'GetAll', N'{}', NULL, CAST(N'2025-05-06T23:20:33.8003067' AS DateTime2), 7, N'::1', NULL, N'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/135.0.0.0 Safari/537.36', NULL, NULL, NULL, 1, NULL)
GO
INSERT [dbo].[AbpAuditLogs] ([Id], [TenantId], [UserId], [ServiceName], [MethodName], [Parameters], [ReturnValue], [ExecutionTime], [ExecutionDuration], [ClientIpAddress], [ClientName], [BrowserInfo], [ExceptionMessage], [Exception], [ImpersonatorUserId], [ImpersonatorTenantId], [CustomData]) VALUES (181, 1, 3, N'School.LMS.StudentEducationalPayment.StudentPaymentAppService', N'GetStudentPaymentDetailsAsync', N'{"studentId":"436"}', NULL, CAST(N'2025-05-06T23:20:34.0261333' AS DateTime2), 103, N'::1', NULL, N'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/135.0.0.0 Safari/537.36', NULL, NULL, NULL, 1, NULL)
GO
INSERT [dbo].[AbpAuditLogs] ([Id], [TenantId], [UserId], [ServiceName], [MethodName], [Parameters], [ReturnValue], [ExecutionTime], [ExecutionDuration], [ClientIpAddress], [ClientName], [BrowserInfo], [ExceptionMessage], [Exception], [ImpersonatorUserId], [ImpersonatorTenantId], [CustomData]) VALUES (182, 1, 3, N'Abp.AspNetCore.Mvc.Controllers.AbpUserConfigurationController', N'GetAll', N'{}', NULL, CAST(N'2025-05-06T23:21:54.2592433' AS DateTime2), 5, N'::1', NULL, N'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/135.0.0.0 Safari/537.36', NULL, NULL, NULL, 1, NULL)
GO
INSERT [dbo].[AbpAuditLogs] ([Id], [TenantId], [UserId], [ServiceName], [MethodName], [Parameters], [ReturnValue], [ExecutionTime], [ExecutionDuration], [ClientIpAddress], [ClientName], [BrowserInfo], [ExceptionMessage], [Exception], [ImpersonatorUserId], [ImpersonatorTenantId], [CustomData]) VALUES (183, 1, 3, N'School.LMS.StudentEducationalPayment.StudentPaymentAppService', N'GetStudentPaymentDetailsAsync', N'{"studentId":"436"}', NULL, CAST(N'2025-05-06T23:21:54.4933868' AS DateTime2), 38, N'::1', NULL, N'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/135.0.0.0 Safari/537.36', NULL, NULL, NULL, 1, NULL)
GO
INSERT [dbo].[AbpAuditLogs] ([Id], [TenantId], [UserId], [ServiceName], [MethodName], [Parameters], [ReturnValue], [ExecutionTime], [ExecutionDuration], [ClientIpAddress], [ClientName], [BrowserInfo], [ExceptionMessage], [Exception], [ImpersonatorUserId], [ImpersonatorTenantId], [CustomData]) VALUES (184, 1, 3, N'Abp.AspNetCore.Mvc.Controllers.AbpUserConfigurationController', N'GetAll', N'{}', NULL, CAST(N'2025-05-06T23:22:17.6236768' AS DateTime2), 3, N'::1', NULL, N'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/135.0.0.0 Safari/537.36', NULL, NULL, NULL, 1, NULL)
GO
INSERT [dbo].[AbpAuditLogs] ([Id], [TenantId], [UserId], [ServiceName], [MethodName], [Parameters], [ReturnValue], [ExecutionTime], [ExecutionDuration], [ClientIpAddress], [ClientName], [BrowserInfo], [ExceptionMessage], [Exception], [ImpersonatorUserId], [ImpersonatorTenantId], [CustomData]) VALUES (185, 1, 3, N'School.LMS.StudentEducationalPayment.StudentPaymentAppService', N'GetStudentPaymentDetailsAsync', N'{"studentId":"436"}', NULL, CAST(N'2025-05-06T23:22:17.8084946' AS DateTime2), 74, N'::1', NULL, N'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/135.0.0.0 Safari/537.36', NULL, NULL, NULL, 1, NULL)
GO
INSERT [dbo].[AbpAuditLogs] ([Id], [TenantId], [UserId], [ServiceName], [MethodName], [Parameters], [ReturnValue], [ExecutionTime], [ExecutionDuration], [ClientIpAddress], [ClientName], [BrowserInfo], [ExceptionMessage], [Exception], [ImpersonatorUserId], [ImpersonatorTenantId], [CustomData]) VALUES (186, 1, 3, N'Abp.AspNetCore.Mvc.Controllers.AbpUserConfigurationController', N'GetAll', N'{}', NULL, CAST(N'2025-05-06T23:23:11.6266214' AS DateTime2), 8, N'::1', NULL, N'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/135.0.0.0 Safari/537.36', NULL, NULL, NULL, 1, NULL)
GO
INSERT [dbo].[AbpAuditLogs] ([Id], [TenantId], [UserId], [ServiceName], [MethodName], [Parameters], [ReturnValue], [ExecutionTime], [ExecutionDuration], [ClientIpAddress], [ClientName], [BrowserInfo], [ExceptionMessage], [Exception], [ImpersonatorUserId], [ImpersonatorTenantId], [CustomData]) VALUES (187, 1, 3, N'School.LMS.StudentEducationalPayment.StudentPaymentAppService', N'GetStudentPaymentDetailsAsync', N'{"studentId":"436"}', NULL, CAST(N'2025-05-06T23:23:11.8828503' AS DateTime2), 70, N'::1', NULL, N'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/135.0.0.0 Safari/537.36', NULL, NULL, NULL, 1, NULL)
GO
INSERT [dbo].[AbpAuditLogs] ([Id], [TenantId], [UserId], [ServiceName], [MethodName], [Parameters], [ReturnValue], [ExecutionTime], [ExecutionDuration], [ClientIpAddress], [ClientName], [BrowserInfo], [ExceptionMessage], [Exception], [ImpersonatorUserId], [ImpersonatorTenantId], [CustomData]) VALUES (188, 1, 3, N'Abp.AspNetCore.Mvc.Controllers.AbpUserConfigurationController', N'GetAll', N'{}', NULL, CAST(N'2025-05-06T23:24:41.0970159' AS DateTime2), 6, N'::1', NULL, N'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/135.0.0.0 Safari/537.36', NULL, NULL, NULL, 1, NULL)
GO
INSERT [dbo].[AbpAuditLogs] ([Id], [TenantId], [UserId], [ServiceName], [MethodName], [Parameters], [ReturnValue], [ExecutionTime], [ExecutionDuration], [ClientIpAddress], [ClientName], [BrowserInfo], [ExceptionMessage], [Exception], [ImpersonatorUserId], [ImpersonatorTenantId], [CustomData]) VALUES (189, 1, 3, N'School.LMS.StudentEducationalPayment.StudentPaymentAppService', N'GetStudentPaymentDetailsAsync', N'{"studentId":"436"}', NULL, CAST(N'2025-05-06T23:24:41.3464448' AS DateTime2), 71, N'::1', NULL, N'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/135.0.0.0 Safari/537.36', NULL, NULL, NULL, 1, NULL)
GO
INSERT [dbo].[AbpAuditLogs] ([Id], [TenantId], [UserId], [ServiceName], [MethodName], [Parameters], [ReturnValue], [ExecutionTime], [ExecutionDuration], [ClientIpAddress], [ClientName], [BrowserInfo], [ExceptionMessage], [Exception], [ImpersonatorUserId], [ImpersonatorTenantId], [CustomData]) VALUES (190, 1, 3, N'Abp.AspNetCore.Mvc.Controllers.AbpUserConfigurationController', N'GetAll', N'{}', NULL, CAST(N'2025-05-06T23:25:11.8210290' AS DateTime2), 5, N'::1', NULL, N'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/135.0.0.0 Safari/537.36', NULL, NULL, NULL, 1, NULL)
GO
INSERT [dbo].[AbpAuditLogs] ([Id], [TenantId], [UserId], [ServiceName], [MethodName], [Parameters], [ReturnValue], [ExecutionTime], [ExecutionDuration], [ClientIpAddress], [ClientName], [BrowserInfo], [ExceptionMessage], [Exception], [ImpersonatorUserId], [ImpersonatorTenantId], [CustomData]) VALUES (191, 1, 3, N'School.LMS.StudentEducationalPayment.StudentPaymentAppService', N'GetStudentPaymentDetailsAsync', N'{"studentId":"436"}', NULL, CAST(N'2025-05-06T23:25:12.2752679' AS DateTime2), 70, N'::1', NULL, N'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/135.0.0.0 Safari/537.36', NULL, NULL, NULL, 1, NULL)
GO
INSERT [dbo].[AbpAuditLogs] ([Id], [TenantId], [UserId], [ServiceName], [MethodName], [Parameters], [ReturnValue], [ExecutionTime], [ExecutionDuration], [ClientIpAddress], [ClientName], [BrowserInfo], [ExceptionMessage], [Exception], [ImpersonatorUserId], [ImpersonatorTenantId], [CustomData]) VALUES (192, 1, 3, N'Abp.AspNetCore.Mvc.Controllers.AbpUserConfigurationController', N'GetAll', N'{}', NULL, CAST(N'2025-05-06T23:25:37.1120990' AS DateTime2), 5, N'::1', NULL, N'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/135.0.0.0 Safari/537.36', NULL, NULL, NULL, 1, NULL)
GO
INSERT [dbo].[AbpAuditLogs] ([Id], [TenantId], [UserId], [ServiceName], [MethodName], [Parameters], [ReturnValue], [ExecutionTime], [ExecutionDuration], [ClientIpAddress], [ClientName], [BrowserInfo], [ExceptionMessage], [Exception], [ImpersonatorUserId], [ImpersonatorTenantId], [CustomData]) VALUES (193, 1, 3, N'School.LMS.StudentEducationalPayment.StudentPaymentAppService', N'GetStudentPaymentDetailsAsync', N'{"studentId":"1127"}', NULL, CAST(N'2025-05-06T23:25:37.3395438' AS DateTime2), 53, N'::1', NULL, N'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/135.0.0.0 Safari/537.36', NULL, NULL, NULL, 1, NULL)
GO
INSERT [dbo].[AbpAuditLogs] ([Id], [TenantId], [UserId], [ServiceName], [MethodName], [Parameters], [ReturnValue], [ExecutionTime], [ExecutionDuration], [ClientIpAddress], [ClientName], [BrowserInfo], [ExceptionMessage], [Exception], [ImpersonatorUserId], [ImpersonatorTenantId], [CustomData]) VALUES (194, 1, 3, N'Abp.AspNetCore.Mvc.Controllers.AbpUserConfigurationController', N'GetAll', N'{}', NULL, CAST(N'2025-05-06T23:25:41.0121109' AS DateTime2), 6, N'::1', NULL, N'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/135.0.0.0 Safari/537.36', NULL, NULL, NULL, 1, NULL)
GO
INSERT [dbo].[AbpAuditLogs] ([Id], [TenantId], [UserId], [ServiceName], [MethodName], [Parameters], [ReturnValue], [ExecutionTime], [ExecutionDuration], [ClientIpAddress], [ClientName], [BrowserInfo], [ExceptionMessage], [Exception], [ImpersonatorUserId], [ImpersonatorTenantId], [CustomData]) VALUES (195, 1, 3, N'School.LMS.StudentEducationalPayment.StudentPaymentAppService', N'GetStudentPaymentDetailsAsync', N'{"studentId":"1127"}', NULL, CAST(N'2025-05-06T23:25:41.2820350' AS DateTime2), 77, N'::1', NULL, N'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/135.0.0.0 Safari/537.36', NULL, NULL, NULL, 1, NULL)
GO
INSERT [dbo].[AbpAuditLogs] ([Id], [TenantId], [UserId], [ServiceName], [MethodName], [Parameters], [ReturnValue], [ExecutionTime], [ExecutionDuration], [ClientIpAddress], [ClientName], [BrowserInfo], [ExceptionMessage], [Exception], [ImpersonatorUserId], [ImpersonatorTenantId], [CustomData]) VALUES (196, 1, 3, N'Abp.AspNetCore.Mvc.Controllers.AbpUserConfigurationController', N'GetAll', N'{}', NULL, CAST(N'2025-05-06T23:38:24.7335492' AS DateTime2), 4, N'::1', NULL, N'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/135.0.0.0 Safari/537.36', NULL, NULL, NULL, 1, NULL)
GO
INSERT [dbo].[AbpAuditLogs] ([Id], [TenantId], [UserId], [ServiceName], [MethodName], [Parameters], [ReturnValue], [ExecutionTime], [ExecutionDuration], [ClientIpAddress], [ClientName], [BrowserInfo], [ExceptionMessage], [Exception], [ImpersonatorUserId], [ImpersonatorTenantId], [CustomData]) VALUES (197, 1, 3, N'School.LMS.StudentEducationalPayment.StudentPaymentAppService', N'GetStudentPaymentDetailsAsync', N'{"studentId":"1127"}', NULL, CAST(N'2025-05-06T23:38:24.9096755' AS DateTime2), 50, N'::1', NULL, N'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/135.0.0.0 Safari/537.36', NULL, NULL, NULL, 1, NULL)
GO
INSERT [dbo].[AbpAuditLogs] ([Id], [TenantId], [UserId], [ServiceName], [MethodName], [Parameters], [ReturnValue], [ExecutionTime], [ExecutionDuration], [ClientIpAddress], [ClientName], [BrowserInfo], [ExceptionMessage], [Exception], [ImpersonatorUserId], [ImpersonatorTenantId], [CustomData]) VALUES (198, 1, 3, N'Abp.AspNetCore.Mvc.Controllers.AbpUserConfigurationController', N'GetAll', N'{}', NULL, CAST(N'2025-05-06T23:39:18.6727675' AS DateTime2), 6, N'::1', NULL, N'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/135.0.0.0 Safari/537.36', NULL, NULL, NULL, 1, NULL)
GO
INSERT [dbo].[AbpAuditLogs] ([Id], [TenantId], [UserId], [ServiceName], [MethodName], [Parameters], [ReturnValue], [ExecutionTime], [ExecutionDuration], [ClientIpAddress], [ClientName], [BrowserInfo], [ExceptionMessage], [Exception], [ImpersonatorUserId], [ImpersonatorTenantId], [CustomData]) VALUES (199, 1, 3, N'School.LMS.StudentEducationalPayment.StudentPaymentAppService', N'GetStudentPaymentDetailsAsync', N'{"studentId":"1127"}', NULL, CAST(N'2025-05-06T23:39:18.9556359' AS DateTime2), 49, N'::1', NULL, N'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/135.0.0.0 Safari/537.36', NULL, NULL, NULL, 1, NULL)
GO
INSERT [dbo].[AbpAuditLogs] ([Id], [TenantId], [UserId], [ServiceName], [MethodName], [Parameters], [ReturnValue], [ExecutionTime], [ExecutionDuration], [ClientIpAddress], [ClientName], [BrowserInfo], [ExceptionMessage], [Exception], [ImpersonatorUserId], [ImpersonatorTenantId], [CustomData]) VALUES (200, 1, 3, N'Abp.AspNetCore.Mvc.Controllers.AbpUserConfigurationController', N'GetAll', N'{}', NULL, CAST(N'2025-05-06T23:39:56.6423725' AS DateTime2), 6, N'::1', NULL, N'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/135.0.0.0 Safari/537.36', NULL, NULL, NULL, 1, NULL)
GO
INSERT [dbo].[AbpAuditLogs] ([Id], [TenantId], [UserId], [ServiceName], [MethodName], [Parameters], [ReturnValue], [ExecutionTime], [ExecutionDuration], [ClientIpAddress], [ClientName], [BrowserInfo], [ExceptionMessage], [Exception], [ImpersonatorUserId], [ImpersonatorTenantId], [CustomData]) VALUES (201, 1, 3, N'School.LMS.StudentEducationalPayment.StudentPaymentAppService', N'GetStudentPaymentDetailsAsync', N'{"studentId":"1127"}', NULL, CAST(N'2025-05-06T23:39:57.0872894' AS DateTime2), 79, N'::1', NULL, N'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/135.0.0.0 Safari/537.36', NULL, NULL, NULL, 1, NULL)
GO
INSERT [dbo].[AbpAuditLogs] ([Id], [TenantId], [UserId], [ServiceName], [MethodName], [Parameters], [ReturnValue], [ExecutionTime], [ExecutionDuration], [ClientIpAddress], [ClientName], [BrowserInfo], [ExceptionMessage], [Exception], [ImpersonatorUserId], [ImpersonatorTenantId], [CustomData]) VALUES (202, 1, 3, N'Abp.AspNetCore.Mvc.Controllers.AbpUserConfigurationController', N'GetAll', N'{}', NULL, CAST(N'2025-05-06T23:40:17.3492087' AS DateTime2), 5, N'::1', NULL, N'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/135.0.0.0 Safari/537.36', NULL, NULL, NULL, 1, NULL)
GO
INSERT [dbo].[AbpAuditLogs] ([Id], [TenantId], [UserId], [ServiceName], [MethodName], [Parameters], [ReturnValue], [ExecutionTime], [ExecutionDuration], [ClientIpAddress], [ClientName], [BrowserInfo], [ExceptionMessage], [Exception], [ImpersonatorUserId], [ImpersonatorTenantId], [CustomData]) VALUES (203, 1, 3, N'School.LMS.StudentEducationalPayment.StudentPaymentAppService', N'GetStudentPaymentDetailsAsync', N'{"studentId":"1127"}', NULL, CAST(N'2025-05-06T23:40:17.7069788' AS DateTime2), 40, N'::1', NULL, N'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/135.0.0.0 Safari/537.36', NULL, NULL, NULL, 1, NULL)
GO
INSERT [dbo].[AbpAuditLogs] ([Id], [TenantId], [UserId], [ServiceName], [MethodName], [Parameters], [ReturnValue], [ExecutionTime], [ExecutionDuration], [ClientIpAddress], [ClientName], [BrowserInfo], [ExceptionMessage], [Exception], [ImpersonatorUserId], [ImpersonatorTenantId], [CustomData]) VALUES (204, 1, 3, N'Abp.AspNetCore.Mvc.Controllers.AbpUserConfigurationController', N'GetAll', N'{}', NULL, CAST(N'2025-05-06T23:40:32.9696715' AS DateTime2), 6, N'::1', NULL, N'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/135.0.0.0 Safari/537.36', NULL, NULL, NULL, 1, NULL)
GO
INSERT [dbo].[AbpAuditLogs] ([Id], [TenantId], [UserId], [ServiceName], [MethodName], [Parameters], [ReturnValue], [ExecutionTime], [ExecutionDuration], [ClientIpAddress], [ClientName], [BrowserInfo], [ExceptionMessage], [Exception], [ImpersonatorUserId], [ImpersonatorTenantId], [CustomData]) VALUES (205, 1, 3, N'School.LMS.StudentEducationalPayment.StudentPaymentAppService', N'GetStudentPaymentDetailsAsync', N'{"studentId":"1127"}', NULL, CAST(N'2025-05-06T23:40:33.1645460' AS DateTime2), 88, N'::1', NULL, N'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/135.0.0.0 Safari/537.36', NULL, NULL, NULL, 1, NULL)
GO
INSERT [dbo].[AbpAuditLogs] ([Id], [TenantId], [UserId], [ServiceName], [MethodName], [Parameters], [ReturnValue], [ExecutionTime], [ExecutionDuration], [ClientIpAddress], [ClientName], [BrowserInfo], [ExceptionMessage], [Exception], [ImpersonatorUserId], [ImpersonatorTenantId], [CustomData]) VALUES (206, 1, 3, N'Abp.AspNetCore.Mvc.Controllers.AbpUserConfigurationController', N'GetAll', N'{}', NULL, CAST(N'2025-05-06T23:40:55.0796410' AS DateTime2), 6, N'::1', NULL, N'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/135.0.0.0 Safari/537.36', NULL, NULL, NULL, 1, NULL)
GO
INSERT [dbo].[AbpAuditLogs] ([Id], [TenantId], [UserId], [ServiceName], [MethodName], [Parameters], [ReturnValue], [ExecutionTime], [ExecutionDuration], [ClientIpAddress], [ClientName], [BrowserInfo], [ExceptionMessage], [Exception], [ImpersonatorUserId], [ImpersonatorTenantId], [CustomData]) VALUES (207, 1, 3, N'School.LMS.StudentEducationalPayment.StudentPaymentAppService', N'GetStudentPaymentDetailsAsync', N'{"studentId":"1127"}', NULL, CAST(N'2025-05-06T23:40:55.3161757' AS DateTime2), 54, N'::1', NULL, N'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/135.0.0.0 Safari/537.36', NULL, NULL, NULL, 1, NULL)
GO
INSERT [dbo].[AbpAuditLogs] ([Id], [TenantId], [UserId], [ServiceName], [MethodName], [Parameters], [ReturnValue], [ExecutionTime], [ExecutionDuration], [ClientIpAddress], [ClientName], [BrowserInfo], [ExceptionMessage], [Exception], [ImpersonatorUserId], [ImpersonatorTenantId], [CustomData]) VALUES (208, 1, 3, N'Abp.AspNetCore.Mvc.Controllers.AbpUserConfigurationController', N'GetAll', N'{}', NULL, CAST(N'2025-05-06T23:41:09.1683377' AS DateTime2), 5, N'::1', NULL, N'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/135.0.0.0 Safari/537.36', NULL, NULL, NULL, 1, NULL)
GO
INSERT [dbo].[AbpAuditLogs] ([Id], [TenantId], [UserId], [ServiceName], [MethodName], [Parameters], [ReturnValue], [ExecutionTime], [ExecutionDuration], [ClientIpAddress], [ClientName], [BrowserInfo], [ExceptionMessage], [Exception], [ImpersonatorUserId], [ImpersonatorTenantId], [CustomData]) VALUES (209, 1, 3, N'School.LMS.StudentEducationalPayment.StudentPaymentAppService', N'GetStudentPaymentDetailsAsync', N'{"studentId":"1127"}', NULL, CAST(N'2025-05-06T23:41:09.4190576' AS DateTime2), 73, N'::1', NULL, N'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/135.0.0.0 Safari/537.36', NULL, NULL, NULL, 1, NULL)
GO
INSERT [dbo].[AbpAuditLogs] ([Id], [TenantId], [UserId], [ServiceName], [MethodName], [Parameters], [ReturnValue], [ExecutionTime], [ExecutionDuration], [ClientIpAddress], [ClientName], [BrowserInfo], [ExceptionMessage], [Exception], [ImpersonatorUserId], [ImpersonatorTenantId], [CustomData]) VALUES (210, 1, 3, N'Abp.AspNetCore.Mvc.Controllers.AbpUserConfigurationController', N'GetAll', N'{}', NULL, CAST(N'2025-05-06T23:41:44.7857236' AS DateTime2), 4, N'::1', NULL, N'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/135.0.0.0 Safari/537.36', NULL, NULL, NULL, 1, NULL)
GO
INSERT [dbo].[AbpAuditLogs] ([Id], [TenantId], [UserId], [ServiceName], [MethodName], [Parameters], [ReturnValue], [ExecutionTime], [ExecutionDuration], [ClientIpAddress], [ClientName], [BrowserInfo], [ExceptionMessage], [Exception], [ImpersonatorUserId], [ImpersonatorTenantId], [CustomData]) VALUES (211, 1, 3, N'School.LMS.StudentEducationalPayment.StudentPaymentAppService', N'GetStudentPaymentDetailsAsync', N'{"studentId":"125"}', NULL, CAST(N'2025-05-06T23:41:44.9895826' AS DateTime2), 64, N'::1', NULL, N'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/135.0.0.0 Safari/537.36', NULL, NULL, NULL, 1, NULL)
GO
INSERT [dbo].[AbpAuditLogs] ([Id], [TenantId], [UserId], [ServiceName], [MethodName], [Parameters], [ReturnValue], [ExecutionTime], [ExecutionDuration], [ClientIpAddress], [ClientName], [BrowserInfo], [ExceptionMessage], [Exception], [ImpersonatorUserId], [ImpersonatorTenantId], [CustomData]) VALUES (212, 1, 3, N'Abp.AspNetCore.Mvc.Controllers.AbpUserConfigurationController', N'GetAll', N'{}', NULL, CAST(N'2025-05-06T23:42:13.0900076' AS DateTime2), 4, N'::1', NULL, N'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/135.0.0.0 Safari/537.36', NULL, NULL, NULL, 1, NULL)
GO
INSERT [dbo].[AbpAuditLogs] ([Id], [TenantId], [UserId], [ServiceName], [MethodName], [Parameters], [ReturnValue], [ExecutionTime], [ExecutionDuration], [ClientIpAddress], [ClientName], [BrowserInfo], [ExceptionMessage], [Exception], [ImpersonatorUserId], [ImpersonatorTenantId], [CustomData]) VALUES (213, 1, 3, N'School.LMS.StudentEducationalPayment.StudentPaymentAppService', N'GetStudentPaymentDetailsAsync', N'{"studentId":"436"}', NULL, CAST(N'2025-05-06T23:42:13.2427360' AS DateTime2), 34, N'::1', NULL, N'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/135.0.0.0 Safari/537.36', NULL, NULL, NULL, 1, NULL)
GO
INSERT [dbo].[AbpAuditLogs] ([Id], [TenantId], [UserId], [ServiceName], [MethodName], [Parameters], [ReturnValue], [ExecutionTime], [ExecutionDuration], [ClientIpAddress], [ClientName], [BrowserInfo], [ExceptionMessage], [Exception], [ImpersonatorUserId], [ImpersonatorTenantId], [CustomData]) VALUES (214, 1, 3, N'Abp.AspNetCore.Mvc.Controllers.AbpUserConfigurationController', N'GetAll', N'{}', NULL, CAST(N'2025-05-06T23:43:38.9684282' AS DateTime2), 4, N'::1', NULL, N'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/135.0.0.0 Safari/537.36', NULL, NULL, NULL, 1, NULL)
GO
INSERT [dbo].[AbpAuditLogs] ([Id], [TenantId], [UserId], [ServiceName], [MethodName], [Parameters], [ReturnValue], [ExecutionTime], [ExecutionDuration], [ClientIpAddress], [ClientName], [BrowserInfo], [ExceptionMessage], [Exception], [ImpersonatorUserId], [ImpersonatorTenantId], [CustomData]) VALUES (215, 1, 3, N'School.LMS.StudentEducationalPayment.StudentPaymentAppService', N'GetStudentPaymentDetailsAsync', N'{"studentId":"436"}', NULL, CAST(N'2025-05-06T23:43:39.2099369' AS DateTime2), 44, N'::1', NULL, N'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/135.0.0.0 Safari/537.36', NULL, NULL, NULL, 1, NULL)
GO
INSERT [dbo].[AbpAuditLogs] ([Id], [TenantId], [UserId], [ServiceName], [MethodName], [Parameters], [ReturnValue], [ExecutionTime], [ExecutionDuration], [ClientIpAddress], [ClientName], [BrowserInfo], [ExceptionMessage], [Exception], [ImpersonatorUserId], [ImpersonatorTenantId], [CustomData]) VALUES (216, 1, 3, N'Abp.AspNetCore.Mvc.Controllers.AbpUserConfigurationController', N'GetAll', N'{}', NULL, CAST(N'2025-05-06T23:44:53.0174385' AS DateTime2), 8, N'::1', NULL, N'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/135.0.0.0 Safari/537.36', NULL, NULL, NULL, 1, NULL)
GO
INSERT [dbo].[AbpAuditLogs] ([Id], [TenantId], [UserId], [ServiceName], [MethodName], [Parameters], [ReturnValue], [ExecutionTime], [ExecutionDuration], [ClientIpAddress], [ClientName], [BrowserInfo], [ExceptionMessage], [Exception], [ImpersonatorUserId], [ImpersonatorTenantId], [CustomData]) VALUES (217, 1, 3, N'School.LMS.StudentEducationalPayment.StudentPaymentAppService', N'GetStudentPaymentDetailsAsync', N'{"studentId":"436"}', NULL, CAST(N'2025-05-06T23:44:53.3441162' AS DateTime2), 41, N'::1', NULL, N'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/135.0.0.0 Safari/537.36', NULL, NULL, NULL, 1, NULL)
GO
INSERT [dbo].[AbpAuditLogs] ([Id], [TenantId], [UserId], [ServiceName], [MethodName], [Parameters], [ReturnValue], [ExecutionTime], [ExecutionDuration], [ClientIpAddress], [ClientName], [BrowserInfo], [ExceptionMessage], [Exception], [ImpersonatorUserId], [ImpersonatorTenantId], [CustomData]) VALUES (218, 1, 3, N'Abp.AspNetCore.Mvc.Controllers.AbpUserConfigurationController', N'GetAll', N'{}', NULL, CAST(N'2025-05-06T23:47:53.6681047' AS DateTime2), 9, N'::1', NULL, N'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/135.0.0.0 Safari/537.36', NULL, NULL, NULL, 1, NULL)
GO
INSERT [dbo].[AbpAuditLogs] ([Id], [TenantId], [UserId], [ServiceName], [MethodName], [Parameters], [ReturnValue], [ExecutionTime], [ExecutionDuration], [ClientIpAddress], [ClientName], [BrowserInfo], [ExceptionMessage], [Exception], [ImpersonatorUserId], [ImpersonatorTenantId], [CustomData]) VALUES (219, 1, 3, N'School.LMS.StudentEducationalPayment.StudentPaymentAppService', N'GetStudentPaymentDetailsAsync', N'{"studentId":"436"}', NULL, CAST(N'2025-05-06T23:47:53.9460250' AS DateTime2), 59, N'::1', NULL, N'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/135.0.0.0 Safari/537.36', NULL, NULL, NULL, 1, NULL)
GO
INSERT [dbo].[AbpAuditLogs] ([Id], [TenantId], [UserId], [ServiceName], [MethodName], [Parameters], [ReturnValue], [ExecutionTime], [ExecutionDuration], [ClientIpAddress], [ClientName], [BrowserInfo], [ExceptionMessage], [Exception], [ImpersonatorUserId], [ImpersonatorTenantId], [CustomData]) VALUES (220, 1, 3, N'School.LMS.StudentEducationalPayment.StudentPaymentAppService', N'SubscribeToBusAsync', N'{"input":{"studentId":436,"busLineId":1,"note":null,"id":0}}', NULL, CAST(N'2025-05-06T23:48:38.0370582' AS DateTime2), 3292, N'::1', NULL, N'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/135.0.0.0 Safari/537.36', NULL, NULL, NULL, 1, NULL)
GO
INSERT [dbo].[AbpAuditLogs] ([Id], [TenantId], [UserId], [ServiceName], [MethodName], [Parameters], [ReturnValue], [ExecutionTime], [ExecutionDuration], [ClientIpAddress], [ClientName], [BrowserInfo], [ExceptionMessage], [Exception], [ImpersonatorUserId], [ImpersonatorTenantId], [CustomData]) VALUES (221, 1, 3, N'Abp.AspNetCore.Mvc.Controllers.AbpUserConfigurationController', N'GetAll', N'{}', NULL, CAST(N'2025-05-06T23:48:45.8692220' AS DateTime2), 6, N'::1', NULL, N'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/135.0.0.0 Safari/537.36', NULL, NULL, NULL, 1, NULL)
GO
INSERT [dbo].[AbpAuditLogs] ([Id], [TenantId], [UserId], [ServiceName], [MethodName], [Parameters], [ReturnValue], [ExecutionTime], [ExecutionDuration], [ClientIpAddress], [ClientName], [BrowserInfo], [ExceptionMessage], [Exception], [ImpersonatorUserId], [ImpersonatorTenantId], [CustomData]) VALUES (222, 1, 3, N'School.LMS.StudentEducationalPayment.StudentPaymentAppService', N'GetStudentPaymentDetailsAsync', N'{"studentId":"436"}', NULL, CAST(N'2025-05-06T23:48:46.1148761' AS DateTime2), 76, N'::1', NULL, N'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/135.0.0.0 Safari/537.36', NULL, NULL, NULL, 1, NULL)
GO
INSERT [dbo].[AbpAuditLogs] ([Id], [TenantId], [UserId], [ServiceName], [MethodName], [Parameters], [ReturnValue], [ExecutionTime], [ExecutionDuration], [ClientIpAddress], [ClientName], [BrowserInfo], [ExceptionMessage], [Exception], [ImpersonatorUserId], [ImpersonatorTenantId], [CustomData]) VALUES (223, 1, 3, N'Abp.AspNetCore.Mvc.Controllers.AbpUserConfigurationController', N'GetAll', N'{}', NULL, CAST(N'2025-05-06T23:49:31.0509369' AS DateTime2), 7, N'::1', NULL, N'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/135.0.0.0 Safari/537.36', NULL, NULL, NULL, 1, NULL)
GO
INSERT [dbo].[AbpAuditLogs] ([Id], [TenantId], [UserId], [ServiceName], [MethodName], [Parameters], [ReturnValue], [ExecutionTime], [ExecutionDuration], [ClientIpAddress], [ClientName], [BrowserInfo], [ExceptionMessage], [Exception], [ImpersonatorUserId], [ImpersonatorTenantId], [CustomData]) VALUES (224, 1, 3, N'School.LMS.StudentEducationalPayment.StudentPaymentAppService', N'GetStudentPaymentDetailsAsync', N'{"studentId":"436"}', NULL, CAST(N'2025-05-06T23:49:31.6518733' AS DateTime2), 66955, N'::1', NULL, N'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/135.0.0.0 Safari/537.36', NULL, NULL, NULL, 1, NULL)
GO
INSERT [dbo].[AbpAuditLogs] ([Id], [TenantId], [UserId], [ServiceName], [MethodName], [Parameters], [ReturnValue], [ExecutionTime], [ExecutionDuration], [ClientIpAddress], [ClientName], [BrowserInfo], [ExceptionMessage], [Exception], [ImpersonatorUserId], [ImpersonatorTenantId], [CustomData]) VALUES (225, 1, NULL, N'School.LMS.Web.Host.Controllers.HomeController', N'Index', N'{}', NULL, CAST(N'2025-05-08T13:15:08.1542325' AS DateTime2), 31, N'::1', NULL, N'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/135.0.0.0 Safari/537.36', NULL, NULL, NULL, 1, NULL)
GO
INSERT [dbo].[AbpAuditLogs] ([Id], [TenantId], [UserId], [ServiceName], [MethodName], [Parameters], [ReturnValue], [ExecutionTime], [ExecutionDuration], [ClientIpAddress], [ClientName], [BrowserInfo], [ExceptionMessage], [Exception], [ImpersonatorUserId], [ImpersonatorTenantId], [CustomData]) VALUES (226, 1, NULL, N'School.LMS.Web.Host.Controllers.AntiForgeryController', N'SetCookie', N'{}', NULL, CAST(N'2025-05-08T13:15:14.0920403' AS DateTime2), 24, N'::1', NULL, N'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/135.0.0.0 Safari/537.36', NULL, NULL, NULL, 1, NULL)
GO
INSERT [dbo].[AbpAuditLogs] ([Id], [TenantId], [UserId], [ServiceName], [MethodName], [Parameters], [ReturnValue], [ExecutionTime], [ExecutionDuration], [ClientIpAddress], [ClientName], [BrowserInfo], [ExceptionMessage], [Exception], [ImpersonatorUserId], [ImpersonatorTenantId], [CustomData]) VALUES (227, 1, NULL, N'Abp.AspNetCore.Mvc.Controllers.AbpUserConfigurationController', N'GetAll', N'{}', NULL, CAST(N'2025-05-08T13:17:30.6620709' AS DateTime2), 610, N'::1', NULL, N'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/135.0.0.0 Safari/537.36', NULL, NULL, NULL, 1, NULL)
GO
INSERT [dbo].[AbpAuditLogs] ([Id], [TenantId], [UserId], [ServiceName], [MethodName], [Parameters], [ReturnValue], [ExecutionTime], [ExecutionDuration], [ClientIpAddress], [ClientName], [BrowserInfo], [ExceptionMessage], [Exception], [ImpersonatorUserId], [ImpersonatorTenantId], [CustomData]) VALUES (228, 1, NULL, N'Abp.AspNetCore.Mvc.Controllers.AbpUserConfigurationController', N'GetAll', N'{}', NULL, CAST(N'2025-05-08T13:23:46.7949804' AS DateTime2), 7, N'::1', NULL, N'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/135.0.0.0 Safari/537.36', NULL, NULL, NULL, 1, NULL)
GO
INSERT [dbo].[AbpAuditLogs] ([Id], [TenantId], [UserId], [ServiceName], [MethodName], [Parameters], [ReturnValue], [ExecutionTime], [ExecutionDuration], [ClientIpAddress], [ClientName], [BrowserInfo], [ExceptionMessage], [Exception], [ImpersonatorUserId], [ImpersonatorTenantId], [CustomData]) VALUES (229, 1, NULL, N'Abp.AspNetCore.Mvc.Controllers.AbpUserConfigurationController', N'GetAll', N'{}', NULL, CAST(N'2025-05-08T13:23:47.6504923' AS DateTime2), 9, N'::1', NULL, N'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/135.0.0.0 Safari/537.36', NULL, NULL, NULL, 1, NULL)
GO
INSERT [dbo].[AbpAuditLogs] ([Id], [TenantId], [UserId], [ServiceName], [MethodName], [Parameters], [ReturnValue], [ExecutionTime], [ExecutionDuration], [ClientIpAddress], [ClientName], [BrowserInfo], [ExceptionMessage], [Exception], [ImpersonatorUserId], [ImpersonatorTenantId], [CustomData]) VALUES (230, 1, NULL, N'School.LMS.Controllers.TokenAuthController', N'Authenticate', N'{"model":{"userNameOrEmailAddress":"admin","rememberClient":false}}', NULL, CAST(N'2025-05-08T13:23:52.8521969' AS DateTime2), 1199, N'::1', NULL, N'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/135.0.0.0 Safari/537.36', NULL, NULL, NULL, 1, NULL)
GO
INSERT [dbo].[AbpAuditLogs] ([Id], [TenantId], [UserId], [ServiceName], [MethodName], [Parameters], [ReturnValue], [ExecutionTime], [ExecutionDuration], [ClientIpAddress], [ClientName], [BrowserInfo], [ExceptionMessage], [Exception], [ImpersonatorUserId], [ImpersonatorTenantId], [CustomData]) VALUES (231, 1, 2, N'Abp.AspNetCore.Mvc.Controllers.AbpUserConfigurationController', N'GetAll', N'{}', NULL, CAST(N'2025-05-08T13:23:55.7755799' AS DateTime2), 259, N'::1', NULL, N'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/135.0.0.0 Safari/537.36', NULL, NULL, NULL, 1, NULL)
GO
INSERT [dbo].[AbpAuditLogs] ([Id], [TenantId], [UserId], [ServiceName], [MethodName], [Parameters], [ReturnValue], [ExecutionTime], [ExecutionDuration], [ClientIpAddress], [ClientName], [BrowserInfo], [ExceptionMessage], [Exception], [ImpersonatorUserId], [ImpersonatorTenantId], [CustomData]) VALUES (232, 1, 2, N'School.LMS.EducationalFeePlan.EducationFeeService', N'GetAllEducationalFees', N'{}', NULL, CAST(N'2025-05-08T13:25:09.7129348' AS DateTime2), 242, N'::1', NULL, N'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/135.0.0.0 Safari/537.36', NULL, NULL, NULL, 1, NULL)
GO
INSERT [dbo].[AbpAuditLogs] ([Id], [TenantId], [UserId], [ServiceName], [MethodName], [Parameters], [ReturnValue], [ExecutionTime], [ExecutionDuration], [ClientIpAddress], [ClientName], [BrowserInfo], [ExceptionMessage], [Exception], [ImpersonatorUserId], [ImpersonatorTenantId], [CustomData]) VALUES (233, 1, 2, N'School.LMS.EducationalFeePlan.EducationFeeService', N'GetAllEducationalFees', N'{}', NULL, CAST(N'2025-05-08T13:25:09.7251188' AS DateTime2), 230, N'::1', NULL, N'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/135.0.0.0 Safari/537.36', NULL, NULL, NULL, 1, NULL)
GO
INSERT [dbo].[AbpAuditLogs] ([Id], [TenantId], [UserId], [ServiceName], [MethodName], [Parameters], [ReturnValue], [ExecutionTime], [ExecutionDuration], [ClientIpAddress], [ClientName], [BrowserInfo], [ExceptionMessage], [Exception], [ImpersonatorUserId], [ImpersonatorTenantId], [CustomData]) VALUES (234, 1, 2, N'School.LMS.Students.StudentImportService', N'GetAllAsync', N'{"input":{"keyword":null}}', NULL, CAST(N'2025-05-08T13:25:09.7556579' AS DateTime2), 775, N'::1', NULL, N'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/135.0.0.0 Safari/537.36', NULL, NULL, NULL, 1, NULL)
GO
INSERT [dbo].[AbpAuditLogs] ([Id], [TenantId], [UserId], [ServiceName], [MethodName], [Parameters], [ReturnValue], [ExecutionTime], [ExecutionDuration], [ClientIpAddress], [ClientName], [BrowserInfo], [ExceptionMessage], [Exception], [ImpersonatorUserId], [ImpersonatorTenantId], [CustomData]) VALUES (235, 1, 2, N'School.LMS.StudentEducationalPayment.StudentPaymentAppService', N'GetStudentPaymentDetailsAsync', N'{"studentId":"436"}', NULL, CAST(N'2025-05-08T13:25:29.5186699' AS DateTime2), 2969, N'::1', NULL, N'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/135.0.0.0 Safari/537.36', NULL, NULL, NULL, 1, NULL)
GO
INSERT [dbo].[AbpAuditLogs] ([Id], [TenantId], [UserId], [ServiceName], [MethodName], [Parameters], [ReturnValue], [ExecutionTime], [ExecutionDuration], [ClientIpAddress], [ClientName], [BrowserInfo], [ExceptionMessage], [Exception], [ImpersonatorUserId], [ImpersonatorTenantId], [CustomData]) VALUES (236, 1, NULL, N'Abp.AspNetCore.Mvc.Controllers.AbpUserConfigurationController', N'GetAll', N'{}', NULL, CAST(N'2025-05-08T13:25:37.9699781' AS DateTime2), 5, N'::1', NULL, N'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/135.0.0.0 Safari/537.36', NULL, NULL, NULL, 1, NULL)
GO
INSERT [dbo].[AbpAuditLogs] ([Id], [TenantId], [UserId], [ServiceName], [MethodName], [Parameters], [ReturnValue], [ExecutionTime], [ExecutionDuration], [ClientIpAddress], [ClientName], [BrowserInfo], [ExceptionMessage], [Exception], [ImpersonatorUserId], [ImpersonatorTenantId], [CustomData]) VALUES (237, 1, NULL, N'School.LMS.Controllers.TokenAuthController', N'Authenticate', N'{"model":{"userNameOrEmailAddress":"01545646456","rememberClient":false}}', NULL, CAST(N'2025-05-08T13:25:44.3140218' AS DateTime2), 341, N'::1', NULL, N'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/135.0.0.0 Safari/537.36', NULL, NULL, NULL, 1, NULL)
GO
INSERT [dbo].[AbpAuditLogs] ([Id], [TenantId], [UserId], [ServiceName], [MethodName], [Parameters], [ReturnValue], [ExecutionTime], [ExecutionDuration], [ClientIpAddress], [ClientName], [BrowserInfo], [ExceptionMessage], [Exception], [ImpersonatorUserId], [ImpersonatorTenantId], [CustomData]) VALUES (238, 1, 3, N'Abp.AspNetCore.Mvc.Controllers.AbpUserConfigurationController', N'GetAll', N'{}', NULL, CAST(N'2025-05-08T13:25:45.2895823' AS DateTime2), 128, N'::1', NULL, N'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/135.0.0.0 Safari/537.36', NULL, NULL, NULL, 1, NULL)
GO
INSERT [dbo].[AbpAuditLogs] ([Id], [TenantId], [UserId], [ServiceName], [MethodName], [Parameters], [ReturnValue], [ExecutionTime], [ExecutionDuration], [ClientIpAddress], [ClientName], [BrowserInfo], [ExceptionMessage], [Exception], [ImpersonatorUserId], [ImpersonatorTenantId], [CustomData]) VALUES (239, 1, 3, N'Abp.AspNetCore.Mvc.Controllers.AbpUserConfigurationController', N'GetAll', N'{}', NULL, CAST(N'2025-05-08T13:30:27.1770432' AS DateTime2), 4, N'::1', NULL, N'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/135.0.0.0 Safari/537.36', NULL, NULL, NULL, 1, NULL)
GO
INSERT [dbo].[AbpAuditLogs] ([Id], [TenantId], [UserId], [ServiceName], [MethodName], [Parameters], [ReturnValue], [ExecutionTime], [ExecutionDuration], [ClientIpAddress], [ClientName], [BrowserInfo], [ExceptionMessage], [Exception], [ImpersonatorUserId], [ImpersonatorTenantId], [CustomData]) VALUES (240, 1, NULL, N'Abp.AspNetCore.Mvc.Controllers.AbpUserConfigurationController', N'GetAll', N'{}', NULL, CAST(N'2025-05-08T13:30:49.8201562' AS DateTime2), 6, N'::1', NULL, N'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/135.0.0.0 Safari/537.36', NULL, NULL, NULL, 1, NULL)
GO
INSERT [dbo].[AbpAuditLogs] ([Id], [TenantId], [UserId], [ServiceName], [MethodName], [Parameters], [ReturnValue], [ExecutionTime], [ExecutionDuration], [ClientIpAddress], [ClientName], [BrowserInfo], [ExceptionMessage], [Exception], [ImpersonatorUserId], [ImpersonatorTenantId], [CustomData]) VALUES (241, 1, NULL, N'School.LMS.Controllers.TokenAuthController', N'Authenticate', N'{"model":{"userNameOrEmailAddress":"01545646456","rememberClient":false}}', NULL, CAST(N'2025-05-08T13:31:14.6709681' AS DateTime2), 307, N'::1', NULL, N'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/135.0.0.0 Safari/537.36', NULL, NULL, NULL, 1, NULL)
GO
INSERT [dbo].[AbpAuditLogs] ([Id], [TenantId], [UserId], [ServiceName], [MethodName], [Parameters], [ReturnValue], [ExecutionTime], [ExecutionDuration], [ClientIpAddress], [ClientName], [BrowserInfo], [ExceptionMessage], [Exception], [ImpersonatorUserId], [ImpersonatorTenantId], [CustomData]) VALUES (242, 1, 3, N'Abp.AspNetCore.Mvc.Controllers.AbpUserConfigurationController', N'GetAll', N'{}', NULL, CAST(N'2025-05-08T13:31:16.3586238' AS DateTime2), 7, N'::1', NULL, N'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/135.0.0.0 Safari/537.36', NULL, NULL, NULL, 1, NULL)
GO
INSERT [dbo].[AbpAuditLogs] ([Id], [TenantId], [UserId], [ServiceName], [MethodName], [Parameters], [ReturnValue], [ExecutionTime], [ExecutionDuration], [ClientIpAddress], [ClientName], [BrowserInfo], [ExceptionMessage], [Exception], [ImpersonatorUserId], [ImpersonatorTenantId], [CustomData]) VALUES (243, 1, 3, N'Abp.AspNetCore.Mvc.Controllers.AbpUserConfigurationController', N'GetAll', N'{}', NULL, CAST(N'2025-05-08T13:32:13.0343600' AS DateTime2), 6, N'::1', NULL, N'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/135.0.0.0 Safari/537.36', NULL, NULL, NULL, 1, NULL)
GO
INSERT [dbo].[AbpAuditLogs] ([Id], [TenantId], [UserId], [ServiceName], [MethodName], [Parameters], [ReturnValue], [ExecutionTime], [ExecutionDuration], [ClientIpAddress], [ClientName], [BrowserInfo], [ExceptionMessage], [Exception], [ImpersonatorUserId], [ImpersonatorTenantId], [CustomData]) VALUES (244, 1, 3, N'Abp.AspNetCore.Mvc.Controllers.AbpUserConfigurationController', N'GetAll', N'{}', NULL, CAST(N'2025-05-08T13:34:44.4368163' AS DateTime2), 4, N'::1', NULL, N'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/135.0.0.0 Safari/537.36', NULL, NULL, NULL, 1, NULL)
GO
INSERT [dbo].[AbpAuditLogs] ([Id], [TenantId], [UserId], [ServiceName], [MethodName], [Parameters], [ReturnValue], [ExecutionTime], [ExecutionDuration], [ClientIpAddress], [ClientName], [BrowserInfo], [ExceptionMessage], [Exception], [ImpersonatorUserId], [ImpersonatorTenantId], [CustomData]) VALUES (245, 1, 3, N'School.LMS.Students.StudentImportService', N'GetAllAsync', N'{"input":{"keyword":null}}', NULL, CAST(N'2025-05-08T13:36:06.4103015' AS DateTime2), 19, N'::1', NULL, N'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/135.0.0.0 Safari/537.36', NULL, NULL, NULL, 1, NULL)
GO
INSERT [dbo].[AbpAuditLogs] ([Id], [TenantId], [UserId], [ServiceName], [MethodName], [Parameters], [ReturnValue], [ExecutionTime], [ExecutionDuration], [ClientIpAddress], [ClientName], [BrowserInfo], [ExceptionMessage], [Exception], [ImpersonatorUserId], [ImpersonatorTenantId], [CustomData]) VALUES (246, 1, 3, N'School.LMS.Roles.RoleAppService', N'GetAllAsync', N'{"input":{"keyword":null,"skipCount":0,"maxResultCount":10}}', NULL, CAST(N'2025-05-08T13:37:30.6075627' AS DateTime2), 127, N'::1', NULL, N'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/135.0.0.0 Safari/537.36', NULL, NULL, NULL, 1, NULL)
GO
INSERT [dbo].[AbpAuditLogs] ([Id], [TenantId], [UserId], [ServiceName], [MethodName], [Parameters], [ReturnValue], [ExecutionTime], [ExecutionDuration], [ClientIpAddress], [ClientName], [BrowserInfo], [ExceptionMessage], [Exception], [ImpersonatorUserId], [ImpersonatorTenantId], [CustomData]) VALUES (247, 1, 3, N'Abp.AspNetCore.Mvc.Controllers.AbpUserConfigurationController', N'GetAll', N'{}', NULL, CAST(N'2025-05-08T13:39:31.6129544' AS DateTime2), 8, N'::1', NULL, N'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/135.0.0.0 Safari/537.36', NULL, NULL, NULL, 1, NULL)
GO
INSERT [dbo].[AbpAuditLogs] ([Id], [TenantId], [UserId], [ServiceName], [MethodName], [Parameters], [ReturnValue], [ExecutionTime], [ExecutionDuration], [ClientIpAddress], [ClientName], [BrowserInfo], [ExceptionMessage], [Exception], [ImpersonatorUserId], [ImpersonatorTenantId], [CustomData]) VALUES (248, 1, 3, N'School.LMS.Roles.RoleAppService', N'GetAllAsync', N'{"input":{"keyword":null,"skipCount":0,"maxResultCount":10}}', NULL, CAST(N'2025-05-08T13:39:31.9644111' AS DateTime2), 49, N'::1', NULL, N'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/135.0.0.0 Safari/537.36', NULL, NULL, NULL, 1, NULL)
GO
INSERT [dbo].[AbpAuditLogs] ([Id], [TenantId], [UserId], [ServiceName], [MethodName], [Parameters], [ReturnValue], [ExecutionTime], [ExecutionDuration], [ClientIpAddress], [ClientName], [BrowserInfo], [ExceptionMessage], [Exception], [ImpersonatorUserId], [ImpersonatorTenantId], [CustomData]) VALUES (249, 1, 3, N'Abp.AspNetCore.Mvc.Controllers.AbpUserConfigurationController', N'GetAll', N'{}', NULL, CAST(N'2025-05-08T13:39:44.4225982' AS DateTime2), 4, N'::1', NULL, N'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/135.0.0.0 Safari/537.36', NULL, NULL, NULL, 1, NULL)
GO
INSERT [dbo].[AbpAuditLogs] ([Id], [TenantId], [UserId], [ServiceName], [MethodName], [Parameters], [ReturnValue], [ExecutionTime], [ExecutionDuration], [ClientIpAddress], [ClientName], [BrowserInfo], [ExceptionMessage], [Exception], [ImpersonatorUserId], [ImpersonatorTenantId], [CustomData]) VALUES (250, 1, 3, N'School.LMS.Roles.RoleAppService', N'GetAllAsync', N'{"input":{"keyword":null,"skipCount":0,"maxResultCount":10}}', NULL, CAST(N'2025-05-08T13:39:44.6444009' AS DateTime2), 36, N'::1', NULL, N'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/135.0.0.0 Safari/537.36', NULL, NULL, NULL, 1, NULL)
GO
INSERT [dbo].[AbpAuditLogs] ([Id], [TenantId], [UserId], [ServiceName], [MethodName], [Parameters], [ReturnValue], [ExecutionTime], [ExecutionDuration], [ClientIpAddress], [ClientName], [BrowserInfo], [ExceptionMessage], [Exception], [ImpersonatorUserId], [ImpersonatorTenantId], [CustomData]) VALUES (251, 1, 3, N'Abp.AspNetCore.Mvc.Controllers.AbpUserConfigurationController', N'GetAll', N'{}', NULL, CAST(N'2025-05-08T13:40:24.7669060' AS DateTime2), 7, N'::1', NULL, N'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/135.0.0.0 Safari/537.36', NULL, NULL, NULL, 1, NULL)
GO
INSERT [dbo].[AbpAuditLogs] ([Id], [TenantId], [UserId], [ServiceName], [MethodName], [Parameters], [ReturnValue], [ExecutionTime], [ExecutionDuration], [ClientIpAddress], [ClientName], [BrowserInfo], [ExceptionMessage], [Exception], [ImpersonatorUserId], [ImpersonatorTenantId], [CustomData]) VALUES (252, 1, 3, N'School.LMS.Roles.RoleAppService', N'GetAllAsync', N'{"input":{"keyword":null,"skipCount":0,"maxResultCount":10}}', NULL, CAST(N'2025-05-08T13:40:27.9401544' AS DateTime2), 172, N'::1', NULL, N'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/135.0.0.0 Safari/537.36', NULL, NULL, NULL, 1, NULL)
GO
INSERT [dbo].[AbpAuditLogs] ([Id], [TenantId], [UserId], [ServiceName], [MethodName], [Parameters], [ReturnValue], [ExecutionTime], [ExecutionDuration], [ClientIpAddress], [ClientName], [BrowserInfo], [ExceptionMessage], [Exception], [ImpersonatorUserId], [ImpersonatorTenantId], [CustomData]) VALUES (253, 1, 3, N'School.LMS.EducationalFeePlan.EducationFeeService', N'GetAllEducationalFees', N'{}', NULL, CAST(N'2025-05-08T13:40:31.1462905' AS DateTime2), 30, N'::1', NULL, N'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/135.0.0.0 Safari/537.36', NULL, NULL, NULL, 1, NULL)
GO
INSERT [dbo].[AbpAuditLogs] ([Id], [TenantId], [UserId], [ServiceName], [MethodName], [Parameters], [ReturnValue], [ExecutionTime], [ExecutionDuration], [ClientIpAddress], [ClientName], [BrowserInfo], [ExceptionMessage], [Exception], [ImpersonatorUserId], [ImpersonatorTenantId], [CustomData]) VALUES (254, 1, 3, N'School.LMS.Students.StudentImportService', N'GetAllAsync', N'{"input":{"keyword":null}}', NULL, CAST(N'2025-05-08T13:40:31.1461248' AS DateTime2), 45, N'::1', NULL, N'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/135.0.0.0 Safari/537.36', NULL, NULL, NULL, 1, NULL)
GO
INSERT [dbo].[AbpAuditLogs] ([Id], [TenantId], [UserId], [ServiceName], [MethodName], [Parameters], [ReturnValue], [ExecutionTime], [ExecutionDuration], [ClientIpAddress], [ClientName], [BrowserInfo], [ExceptionMessage], [Exception], [ImpersonatorUserId], [ImpersonatorTenantId], [CustomData]) VALUES (255, 1, 3, N'School.LMS.EducationalFeePlan.EducationFeeService', N'GetAllEducationalFees', N'{}', NULL, CAST(N'2025-05-08T13:40:31.1541970' AS DateTime2), 53, N'::1', NULL, N'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/135.0.0.0 Safari/537.36', NULL, NULL, NULL, 1, NULL)
GO
INSERT [dbo].[AbpAuditLogs] ([Id], [TenantId], [UserId], [ServiceName], [MethodName], [Parameters], [ReturnValue], [ExecutionTime], [ExecutionDuration], [ClientIpAddress], [ClientName], [BrowserInfo], [ExceptionMessage], [Exception], [ImpersonatorUserId], [ImpersonatorTenantId], [CustomData]) VALUES (256, 1, 3, N'Abp.AspNetCore.Mvc.Controllers.AbpUserConfigurationController', N'GetAll', N'{}', NULL, CAST(N'2025-05-08T14:06:56.0147102' AS DateTime2), 8, N'::1', NULL, N'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/135.0.0.0 Safari/537.36', NULL, NULL, NULL, 1, NULL)
GO
INSERT [dbo].[AbpAuditLogs] ([Id], [TenantId], [UserId], [ServiceName], [MethodName], [Parameters], [ReturnValue], [ExecutionTime], [ExecutionDuration], [ClientIpAddress], [ClientName], [BrowserInfo], [ExceptionMessage], [Exception], [ImpersonatorUserId], [ImpersonatorTenantId], [CustomData]) VALUES (257, 1, 3, N'Abp.AspNetCore.Mvc.Controllers.AbpUserConfigurationController', N'GetAll', N'{}', NULL, CAST(N'2025-05-08T14:10:11.8553517' AS DateTime2), 7, N'::1', NULL, N'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/135.0.0.0 Safari/537.36', NULL, NULL, NULL, 1, NULL)
GO
INSERT [dbo].[AbpAuditLogs] ([Id], [TenantId], [UserId], [ServiceName], [MethodName], [Parameters], [ReturnValue], [ExecutionTime], [ExecutionDuration], [ClientIpAddress], [ClientName], [BrowserInfo], [ExceptionMessage], [Exception], [ImpersonatorUserId], [ImpersonatorTenantId], [CustomData]) VALUES (258, 1, 3, N'Abp.AspNetCore.Mvc.Controllers.AbpUserConfigurationController', N'GetAll', N'{}', NULL, CAST(N'2025-05-08T14:24:26.4724060' AS DateTime2), 6, N'::1', NULL, N'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/135.0.0.0 Safari/537.36', NULL, NULL, NULL, 1, NULL)
GO
INSERT [dbo].[AbpAuditLogs] ([Id], [TenantId], [UserId], [ServiceName], [MethodName], [Parameters], [ReturnValue], [ExecutionTime], [ExecutionDuration], [ClientIpAddress], [ClientName], [BrowserInfo], [ExceptionMessage], [Exception], [ImpersonatorUserId], [ImpersonatorTenantId], [CustomData]) VALUES (259, 1, 3, N'Abp.AspNetCore.Mvc.Controllers.AbpUserConfigurationController', N'GetAll', N'{}', NULL, CAST(N'2025-05-08T14:26:01.2279792' AS DateTime2), 9, N'::1', NULL, N'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/135.0.0.0 Safari/537.36', NULL, NULL, NULL, 1, NULL)
GO
INSERT [dbo].[AbpAuditLogs] ([Id], [TenantId], [UserId], [ServiceName], [MethodName], [Parameters], [ReturnValue], [ExecutionTime], [ExecutionDuration], [ClientIpAddress], [ClientName], [BrowserInfo], [ExceptionMessage], [Exception], [ImpersonatorUserId], [ImpersonatorTenantId], [CustomData]) VALUES (260, 1, 3, N'School.LMS.StudentEducationalPayment.StudentPaymentAppService', N'GetStudentPaymentDetailsAsync', N'{"studentId":"436"}', NULL, CAST(N'2025-05-08T14:32:18.2242320' AS DateTime2), 74, N'::1', NULL, N'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/135.0.0.0 Safari/537.36', NULL, NULL, NULL, 1, NULL)
GO
INSERT [dbo].[AbpAuditLogs] ([Id], [TenantId], [UserId], [ServiceName], [MethodName], [Parameters], [ReturnValue], [ExecutionTime], [ExecutionDuration], [ClientIpAddress], [ClientName], [BrowserInfo], [ExceptionMessage], [Exception], [ImpersonatorUserId], [ImpersonatorTenantId], [CustomData]) VALUES (261, 1, 3, N'Abp.AspNetCore.Mvc.Controllers.AbpUserConfigurationController', N'GetAll', N'{}', NULL, CAST(N'2025-05-08T14:34:57.8051017' AS DateTime2), 4, N'::1', NULL, N'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/135.0.0.0 Safari/537.36', NULL, NULL, NULL, 1, NULL)
GO
INSERT [dbo].[AbpAuditLogs] ([Id], [TenantId], [UserId], [ServiceName], [MethodName], [Parameters], [ReturnValue], [ExecutionTime], [ExecutionDuration], [ClientIpAddress], [ClientName], [BrowserInfo], [ExceptionMessage], [Exception], [ImpersonatorUserId], [ImpersonatorTenantId], [CustomData]) VALUES (262, 1, 3, N'School.LMS.StudentEducationalPayment.StudentPaymentAppService', N'GetStudentPaymentDetailsAsync', N'{"studentId":"436"}', NULL, CAST(N'2025-05-08T14:34:59.5606659' AS DateTime2), 206, N'::1', NULL, N'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/135.0.0.0 Safari/537.36', NULL, NULL, NULL, 1, NULL)
GO
INSERT [dbo].[AbpAuditLogs] ([Id], [TenantId], [UserId], [ServiceName], [MethodName], [Parameters], [ReturnValue], [ExecutionTime], [ExecutionDuration], [ClientIpAddress], [ClientName], [BrowserInfo], [ExceptionMessage], [Exception], [ImpersonatorUserId], [ImpersonatorTenantId], [CustomData]) VALUES (263, 1, NULL, N'School.LMS.Web.Host.Controllers.HomeController', N'Index', N'{}', NULL, CAST(N'2025-05-08T14:39:11.3704132' AS DateTime2), 14, N'::1', NULL, N'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/135.0.0.0 Safari/537.36', NULL, NULL, NULL, 1, NULL)
GO
INSERT [dbo].[AbpAuditLogs] ([Id], [TenantId], [UserId], [ServiceName], [MethodName], [Parameters], [ReturnValue], [ExecutionTime], [ExecutionDuration], [ClientIpAddress], [ClientName], [BrowserInfo], [ExceptionMessage], [Exception], [ImpersonatorUserId], [ImpersonatorTenantId], [CustomData]) VALUES (264, 1, 3, N'School.LMS.Web.Host.Controllers.AntiForgeryController', N'SetCookie', N'{}', NULL, CAST(N'2025-05-08T14:39:12.9198275' AS DateTime2), 23, N'::1', NULL, N'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/135.0.0.0 Safari/537.36', NULL, NULL, NULL, 1, NULL)
GO
INSERT [dbo].[AbpAuditLogs] ([Id], [TenantId], [UserId], [ServiceName], [MethodName], [Parameters], [ReturnValue], [ExecutionTime], [ExecutionDuration], [ClientIpAddress], [ClientName], [BrowserInfo], [ExceptionMessage], [Exception], [ImpersonatorUserId], [ImpersonatorTenantId], [CustomData]) VALUES (265, 1, 3, N'Abp.AspNetCore.Mvc.Controllers.AbpUserConfigurationController', N'GetAll', N'{}', NULL, CAST(N'2025-05-08T14:39:55.1989140' AS DateTime2), 1269, N'::1', NULL, N'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/135.0.0.0 Safari/537.36', NULL, NULL, NULL, 1, NULL)
GO
INSERT [dbo].[AbpAuditLogs] ([Id], [TenantId], [UserId], [ServiceName], [MethodName], [Parameters], [ReturnValue], [ExecutionTime], [ExecutionDuration], [ClientIpAddress], [ClientName], [BrowserInfo], [ExceptionMessage], [Exception], [ImpersonatorUserId], [ImpersonatorTenantId], [CustomData]) VALUES (266, 1, 3, N'School.LMS.StudentEducationalPayment.StudentPaymentAppService', N'GetStudentPaymentDetailsAsync', N'{"studentId":"436"}', NULL, CAST(N'2025-05-08T14:39:58.8009473' AS DateTime2), 549, N'::1', NULL, N'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/135.0.0.0 Safari/537.36', NULL, NULL, NULL, 1, NULL)
GO
INSERT [dbo].[AbpAuditLogs] ([Id], [TenantId], [UserId], [ServiceName], [MethodName], [Parameters], [ReturnValue], [ExecutionTime], [ExecutionDuration], [ClientIpAddress], [ClientName], [BrowserInfo], [ExceptionMessage], [Exception], [ImpersonatorUserId], [ImpersonatorTenantId], [CustomData]) VALUES (267, 1, 3, N'Abp.AspNetCore.Mvc.Controllers.AbpUserConfigurationController', N'GetAll', N'{}', NULL, CAST(N'2025-05-08T14:41:02.1990542' AS DateTime2), 13, N'::1', NULL, N'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/135.0.0.0 Safari/537.36', NULL, NULL, NULL, 1, NULL)
GO
INSERT [dbo].[AbpAuditLogs] ([Id], [TenantId], [UserId], [ServiceName], [MethodName], [Parameters], [ReturnValue], [ExecutionTime], [ExecutionDuration], [ClientIpAddress], [ClientName], [BrowserInfo], [ExceptionMessage], [Exception], [ImpersonatorUserId], [ImpersonatorTenantId], [CustomData]) VALUES (268, 1, 3, N'School.LMS.StudentEducationalPayment.StudentPaymentAppService', N'GetStudentPaymentDetailsAsync', N'{"studentId":"436"}', NULL, CAST(N'2025-05-08T14:41:08.4692288' AS DateTime2), 107, N'::1', NULL, N'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/135.0.0.0 Safari/537.36', NULL, NULL, NULL, 1, NULL)
GO
INSERT [dbo].[AbpAuditLogs] ([Id], [TenantId], [UserId], [ServiceName], [MethodName], [Parameters], [ReturnValue], [ExecutionTime], [ExecutionDuration], [ClientIpAddress], [ClientName], [BrowserInfo], [ExceptionMessage], [Exception], [ImpersonatorUserId], [ImpersonatorTenantId], [CustomData]) VALUES (269, 1, 3, N'Abp.AspNetCore.Mvc.Controllers.AbpUserConfigurationController', N'GetAll', N'{}', NULL, CAST(N'2025-05-08T14:41:56.8867852' AS DateTime2), 8, N'::1', NULL, N'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/135.0.0.0 Safari/537.36', NULL, NULL, NULL, 1, NULL)
GO
INSERT [dbo].[AbpAuditLogs] ([Id], [TenantId], [UserId], [ServiceName], [MethodName], [Parameters], [ReturnValue], [ExecutionTime], [ExecutionDuration], [ClientIpAddress], [ClientName], [BrowserInfo], [ExceptionMessage], [Exception], [ImpersonatorUserId], [ImpersonatorTenantId], [CustomData]) VALUES (270, 1, 3, N'School.LMS.StudentEducationalPayment.StudentPaymentAppService', N'GetStudentPaymentDetailsAsync', N'{"studentId":"436"}', NULL, CAST(N'2025-05-08T14:42:08.8420507' AS DateTime2), 123, N'::1', NULL, N'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/135.0.0.0 Safari/537.36', NULL, NULL, NULL, 1, NULL)
GO
INSERT [dbo].[AbpAuditLogs] ([Id], [TenantId], [UserId], [ServiceName], [MethodName], [Parameters], [ReturnValue], [ExecutionTime], [ExecutionDuration], [ClientIpAddress], [ClientName], [BrowserInfo], [ExceptionMessage], [Exception], [ImpersonatorUserId], [ImpersonatorTenantId], [CustomData]) VALUES (271, 1, 3, N'School.LMS.StudentEducationalPayment.StudentPaymentAppService', N'GetStudentByName', N'{"studentName":"Ahmed Ali"}', NULL, CAST(N'2025-05-08T14:41:59.9357147' AS DateTime2), 9059, N'::1', NULL, N'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/135.0.0.0 Safari/537.36', NULL, NULL, NULL, 1, NULL)
GO
INSERT [dbo].[AbpAuditLogs] ([Id], [TenantId], [UserId], [ServiceName], [MethodName], [Parameters], [ReturnValue], [ExecutionTime], [ExecutionDuration], [ClientIpAddress], [ClientName], [BrowserInfo], [ExceptionMessage], [Exception], [ImpersonatorUserId], [ImpersonatorTenantId], [CustomData]) VALUES (272, 1, 3, N'Abp.AspNetCore.Mvc.Controllers.AbpUserConfigurationController', N'GetAll', N'{}', NULL, CAST(N'2025-05-08T14:43:26.2297246' AS DateTime2), 12, N'::1', NULL, N'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/135.0.0.0 Safari/537.36', NULL, NULL, NULL, 1, NULL)
GO
INSERT [dbo].[AbpAuditLogs] ([Id], [TenantId], [UserId], [ServiceName], [MethodName], [Parameters], [ReturnValue], [ExecutionTime], [ExecutionDuration], [ClientIpAddress], [ClientName], [BrowserInfo], [ExceptionMessage], [Exception], [ImpersonatorUserId], [ImpersonatorTenantId], [CustomData]) VALUES (273, 1, 3, N'School.LMS.StudentEducationalPayment.StudentPaymentAppService', N'GetStudentByName', N'{"studentName":"Ahmed Ali"}', NULL, CAST(N'2025-05-08T14:43:32.6490370' AS DateTime2), 16, N'::1', NULL, N'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/135.0.0.0 Safari/537.36', NULL, NULL, NULL, 1, NULL)
GO
INSERT [dbo].[AbpAuditLogs] ([Id], [TenantId], [UserId], [ServiceName], [MethodName], [Parameters], [ReturnValue], [ExecutionTime], [ExecutionDuration], [ClientIpAddress], [ClientName], [BrowserInfo], [ExceptionMessage], [Exception], [ImpersonatorUserId], [ImpersonatorTenantId], [CustomData]) VALUES (274, 1, 3, N'School.LMS.StudentEducationalPayment.StudentPaymentAppService', N'GetStudentPaymentDetailsAsync', N'{"studentId":"125"}', NULL, CAST(N'2025-05-08T14:43:32.9194467' AS DateTime2), 57, N'::1', NULL, N'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/135.0.0.0 Safari/537.36', NULL, NULL, NULL, 1, NULL)
GO
INSERT [dbo].[AbpAuditLogs] ([Id], [TenantId], [UserId], [ServiceName], [MethodName], [Parameters], [ReturnValue], [ExecutionTime], [ExecutionDuration], [ClientIpAddress], [ClientName], [BrowserInfo], [ExceptionMessage], [Exception], [ImpersonatorUserId], [ImpersonatorTenantId], [CustomData]) VALUES (275, 1, 3, N'School.LMS.EducationalFeePlan.EducationFeeService', N'GetAllEducationalFees', N'{}', NULL, CAST(N'2025-05-08T14:44:51.0203924' AS DateTime2), 113, N'::1', NULL, N'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/135.0.0.0 Safari/537.36', NULL, NULL, NULL, 1, NULL)
GO
INSERT [dbo].[AbpAuditLogs] ([Id], [TenantId], [UserId], [ServiceName], [MethodName], [Parameters], [ReturnValue], [ExecutionTime], [ExecutionDuration], [ClientIpAddress], [ClientName], [BrowserInfo], [ExceptionMessage], [Exception], [ImpersonatorUserId], [ImpersonatorTenantId], [CustomData]) VALUES (276, 1, 3, N'School.LMS.EducationalFeePlan.EducationFeeService', N'GetAllEducationalFees', N'{}', NULL, CAST(N'2025-05-08T14:44:51.0144455' AS DateTime2), 119, N'::1', NULL, N'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/135.0.0.0 Safari/537.36', NULL, NULL, NULL, 1, NULL)
GO
INSERT [dbo].[AbpAuditLogs] ([Id], [TenantId], [UserId], [ServiceName], [MethodName], [Parameters], [ReturnValue], [ExecutionTime], [ExecutionDuration], [ClientIpAddress], [ClientName], [BrowserInfo], [ExceptionMessage], [Exception], [ImpersonatorUserId], [ImpersonatorTenantId], [CustomData]) VALUES (277, 1, 3, N'School.LMS.Students.StudentImportService', N'GetAllAsync', N'{"input":{"keyword":null}}', NULL, CAST(N'2025-05-08T14:44:51.0921275' AS DateTime2), 939, N'::1', NULL, N'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/135.0.0.0 Safari/537.36', NULL, NULL, NULL, 1, NULL)
GO
INSERT [dbo].[AbpAuditLogs] ([Id], [TenantId], [UserId], [ServiceName], [MethodName], [Parameters], [ReturnValue], [ExecutionTime], [ExecutionDuration], [ClientIpAddress], [ClientName], [BrowserInfo], [ExceptionMessage], [Exception], [ImpersonatorUserId], [ImpersonatorTenantId], [CustomData]) VALUES (278, 1, 3, N'School.LMS.StudentEducationalPayment.StudentPaymentAppService', N'GetStudentByName', N'{"studentName":"Ahmed Ali"}', NULL, CAST(N'2025-05-08T14:44:56.6759642' AS DateTime2), 6, N'::1', NULL, N'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/135.0.0.0 Safari/537.36', NULL, NULL, NULL, 1, NULL)
GO
INSERT [dbo].[AbpAuditLogs] ([Id], [TenantId], [UserId], [ServiceName], [MethodName], [Parameters], [ReturnValue], [ExecutionTime], [ExecutionDuration], [ClientIpAddress], [ClientName], [BrowserInfo], [ExceptionMessage], [Exception], [ImpersonatorUserId], [ImpersonatorTenantId], [CustomData]) VALUES (279, 1, 3, N'School.LMS.StudentEducationalPayment.StudentPaymentAppService', N'GetStudentPaymentDetailsAsync', N'{"studentId":"125"}', NULL, CAST(N'2025-05-08T14:44:56.7271198' AS DateTime2), 33, N'::1', NULL, N'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/135.0.0.0 Safari/537.36', NULL, NULL, NULL, 1, NULL)
GO
INSERT [dbo].[AbpAuditLogs] ([Id], [TenantId], [UserId], [ServiceName], [MethodName], [Parameters], [ReturnValue], [ExecutionTime], [ExecutionDuration], [ClientIpAddress], [ClientName], [BrowserInfo], [ExceptionMessage], [Exception], [ImpersonatorUserId], [ImpersonatorTenantId], [CustomData]) VALUES (280, 1, 3, N'School.LMS.Users.UserAppService', N'ChangeLanguage', N'{"input":{"languageName":"ar"}}', NULL, CAST(N'2025-05-08T14:45:13.7605747' AS DateTime2), 194, N'::1', NULL, N'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/135.0.0.0 Safari/537.36', NULL, NULL, NULL, 1, NULL)
GO
INSERT [dbo].[AbpAuditLogs] ([Id], [TenantId], [UserId], [ServiceName], [MethodName], [Parameters], [ReturnValue], [ExecutionTime], [ExecutionDuration], [ClientIpAddress], [ClientName], [BrowserInfo], [ExceptionMessage], [Exception], [ImpersonatorUserId], [ImpersonatorTenantId], [CustomData]) VALUES (281, 1, 3, N'Abp.AspNetCore.Mvc.Controllers.AbpUserConfigurationController', N'GetAll', N'{}', NULL, CAST(N'2025-05-08T14:45:15.0290953' AS DateTime2), 109, N'::1', NULL, N'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/135.0.0.0 Safari/537.36', NULL, NULL, NULL, 1, NULL)
GO
INSERT [dbo].[AbpAuditLogs] ([Id], [TenantId], [UserId], [ServiceName], [MethodName], [Parameters], [ReturnValue], [ExecutionTime], [ExecutionDuration], [ClientIpAddress], [ClientName], [BrowserInfo], [ExceptionMessage], [Exception], [ImpersonatorUserId], [ImpersonatorTenantId], [CustomData]) VALUES (282, 1, 3, N'School.LMS.StudentEducationalPayment.StudentPaymentAppService', N'GetStudentByName', N'{"studentName":"Ahmed Ali"}', NULL, CAST(N'2025-05-08T14:45:15.5861125' AS DateTime2), 69, N'::1', NULL, N'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/135.0.0.0 Safari/537.36', NULL, NULL, NULL, 1, NULL)
GO
INSERT [dbo].[AbpAuditLogs] ([Id], [TenantId], [UserId], [ServiceName], [MethodName], [Parameters], [ReturnValue], [ExecutionTime], [ExecutionDuration], [ClientIpAddress], [ClientName], [BrowserInfo], [ExceptionMessage], [Exception], [ImpersonatorUserId], [ImpersonatorTenantId], [CustomData]) VALUES (283, 1, 3, N'School.LMS.StudentEducationalPayment.StudentPaymentAppService', N'GetStudentPaymentDetailsAsync', N'{"studentId":"125"}', NULL, CAST(N'2025-05-08T14:45:15.8116161' AS DateTime2), 79, N'::1', NULL, N'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/135.0.0.0 Safari/537.36', NULL, NULL, NULL, 1, NULL)
GO
INSERT [dbo].[AbpAuditLogs] ([Id], [TenantId], [UserId], [ServiceName], [MethodName], [Parameters], [ReturnValue], [ExecutionTime], [ExecutionDuration], [ClientIpAddress], [ClientName], [BrowserInfo], [ExceptionMessage], [Exception], [ImpersonatorUserId], [ImpersonatorTenantId], [CustomData]) VALUES (284, 1, 3, N'School.LMS.Users.UserAppService', N'ChangeLanguage', N'{"input":{"languageName":"en"}}', NULL, CAST(N'2025-05-08T14:45:24.0511353' AS DateTime2), 33, N'::1', NULL, N'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/135.0.0.0 Safari/537.36', NULL, NULL, NULL, 1, NULL)
GO
INSERT [dbo].[AbpAuditLogs] ([Id], [TenantId], [UserId], [ServiceName], [MethodName], [Parameters], [ReturnValue], [ExecutionTime], [ExecutionDuration], [ClientIpAddress], [ClientName], [BrowserInfo], [ExceptionMessage], [Exception], [ImpersonatorUserId], [ImpersonatorTenantId], [CustomData]) VALUES (285, 1, 3, N'Abp.AspNetCore.Mvc.Controllers.AbpUserConfigurationController', N'GetAll', N'{}', NULL, CAST(N'2025-05-08T14:45:24.9568457' AS DateTime2), 10, N'::1', NULL, N'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/135.0.0.0 Safari/537.36', NULL, NULL, NULL, 1, NULL)
GO
INSERT [dbo].[AbpAuditLogs] ([Id], [TenantId], [UserId], [ServiceName], [MethodName], [Parameters], [ReturnValue], [ExecutionTime], [ExecutionDuration], [ClientIpAddress], [ClientName], [BrowserInfo], [ExceptionMessage], [Exception], [ImpersonatorUserId], [ImpersonatorTenantId], [CustomData]) VALUES (286, 1, 3, N'School.LMS.StudentEducationalPayment.StudentPaymentAppService', N'GetStudentByName', N'{"studentName":"Ahmed Ali"}', NULL, CAST(N'2025-05-08T14:45:25.1878126' AS DateTime2), 42, N'::1', NULL, N'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/135.0.0.0 Safari/537.36', NULL, NULL, NULL, 1, NULL)
GO
INSERT [dbo].[AbpAuditLogs] ([Id], [TenantId], [UserId], [ServiceName], [MethodName], [Parameters], [ReturnValue], [ExecutionTime], [ExecutionDuration], [ClientIpAddress], [ClientName], [BrowserInfo], [ExceptionMessage], [Exception], [ImpersonatorUserId], [ImpersonatorTenantId], [CustomData]) VALUES (287, 1, 3, N'School.LMS.StudentEducationalPayment.StudentPaymentAppService', N'GetStudentPaymentDetailsAsync', N'{"studentId":"125"}', NULL, CAST(N'2025-05-08T14:45:25.3394207' AS DateTime2), 38, N'::1', NULL, N'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/135.0.0.0 Safari/537.36', NULL, NULL, NULL, 1, NULL)
GO
INSERT [dbo].[AbpAuditLogs] ([Id], [TenantId], [UserId], [ServiceName], [MethodName], [Parameters], [ReturnValue], [ExecutionTime], [ExecutionDuration], [ClientIpAddress], [ClientName], [BrowserInfo], [ExceptionMessage], [Exception], [ImpersonatorUserId], [ImpersonatorTenantId], [CustomData]) VALUES (288, 1, 3, N'Abp.AspNetCore.Mvc.Controllers.AbpUserConfigurationController', N'GetAll', N'{}', NULL, CAST(N'2025-05-08T14:47:52.2730980' AS DateTime2), 9, N'::1', NULL, N'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/135.0.0.0 Safari/537.36', NULL, NULL, NULL, 1, NULL)
GO
INSERT [dbo].[AbpAuditLogs] ([Id], [TenantId], [UserId], [ServiceName], [MethodName], [Parameters], [ReturnValue], [ExecutionTime], [ExecutionDuration], [ClientIpAddress], [ClientName], [BrowserInfo], [ExceptionMessage], [Exception], [ImpersonatorUserId], [ImpersonatorTenantId], [CustomData]) VALUES (289, 1, 3, N'School.LMS.StudentEducationalPayment.StudentPaymentAppService', N'GetStudentByName', N'{"studentName":"Ahmed Ali"}', NULL, CAST(N'2025-05-08T14:47:58.5363873' AS DateTime2), 215, N'::1', NULL, N'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/135.0.0.0 Safari/537.36', NULL, NULL, NULL, 1, NULL)
GO
INSERT [dbo].[AbpAuditLogs] ([Id], [TenantId], [UserId], [ServiceName], [MethodName], [Parameters], [ReturnValue], [ExecutionTime], [ExecutionDuration], [ClientIpAddress], [ClientName], [BrowserInfo], [ExceptionMessage], [Exception], [ImpersonatorUserId], [ImpersonatorTenantId], [CustomData]) VALUES (290, 1, 3, N'School.LMS.StudentEducationalPayment.StudentPaymentAppService', N'GetStudentPaymentDetailsAsync', N'{"studentId":"125"}', NULL, CAST(N'2025-05-08T14:47:59.0433033' AS DateTime2), 118, N'::1', NULL, N'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/135.0.0.0 Safari/537.36', NULL, NULL, NULL, 1, NULL)
GO
INSERT [dbo].[AbpAuditLogs] ([Id], [TenantId], [UserId], [ServiceName], [MethodName], [Parameters], [ReturnValue], [ExecutionTime], [ExecutionDuration], [ClientIpAddress], [ClientName], [BrowserInfo], [ExceptionMessage], [Exception], [ImpersonatorUserId], [ImpersonatorTenantId], [CustomData]) VALUES (291, 1, 3, N'Abp.AspNetCore.Mvc.Controllers.AbpUserConfigurationController', N'GetAll', N'{}', NULL, CAST(N'2025-05-08T14:48:40.1197771' AS DateTime2), 9, N'::1', NULL, N'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/135.0.0.0 Safari/537.36', NULL, NULL, NULL, 1, NULL)
GO
INSERT [dbo].[AbpAuditLogs] ([Id], [TenantId], [UserId], [ServiceName], [MethodName], [Parameters], [ReturnValue], [ExecutionTime], [ExecutionDuration], [ClientIpAddress], [ClientName], [BrowserInfo], [ExceptionMessage], [Exception], [ImpersonatorUserId], [ImpersonatorTenantId], [CustomData]) VALUES (292, 1, 3, N'School.LMS.StudentEducationalPayment.StudentPaymentAppService', N'GetStudentByName', N'{"studentName":"Ahmed Ali"}', NULL, CAST(N'2025-05-08T14:48:41.2976105' AS DateTime2), 19, N'::1', NULL, N'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/135.0.0.0 Safari/537.36', NULL, NULL, NULL, 1, NULL)
GO
INSERT [dbo].[AbpAuditLogs] ([Id], [TenantId], [UserId], [ServiceName], [MethodName], [Parameters], [ReturnValue], [ExecutionTime], [ExecutionDuration], [ClientIpAddress], [ClientName], [BrowserInfo], [ExceptionMessage], [Exception], [ImpersonatorUserId], [ImpersonatorTenantId], [CustomData]) VALUES (293, 1, 3, N'School.LMS.StudentEducationalPayment.StudentPaymentAppService', N'GetStudentPaymentDetailsAsync', N'{"studentId":"125"}', NULL, CAST(N'2025-05-08T14:48:41.7420812' AS DateTime2), 45030, N'::1', NULL, N'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/135.0.0.0 Safari/537.36', NULL, NULL, NULL, 1, NULL)
GO
INSERT [dbo].[AbpAuditLogs] ([Id], [TenantId], [UserId], [ServiceName], [MethodName], [Parameters], [ReturnValue], [ExecutionTime], [ExecutionDuration], [ClientIpAddress], [ClientName], [BrowserInfo], [ExceptionMessage], [Exception], [ImpersonatorUserId], [ImpersonatorTenantId], [CustomData]) VALUES (294, 1, NULL, N'Abp.AspNetCore.Mvc.Controllers.AbpUserConfigurationController', N'GetAll', N'{}', NULL, CAST(N'2025-05-08T14:49:32.2849219' AS DateTime2), 10, N'::1', NULL, N'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/135.0.0.0 Safari/537.36', NULL, NULL, NULL, 1, NULL)
GO
INSERT [dbo].[AbpAuditLogs] ([Id], [TenantId], [UserId], [ServiceName], [MethodName], [Parameters], [ReturnValue], [ExecutionTime], [ExecutionDuration], [ClientIpAddress], [ClientName], [BrowserInfo], [ExceptionMessage], [Exception], [ImpersonatorUserId], [ImpersonatorTenantId], [CustomData]) VALUES (295, 1, NULL, N'School.LMS.Controllers.TokenAuthController', N'Authenticate', N'{"model":{"userNameOrEmailAddress":"01014267914","rememberClient":false}}', NULL, CAST(N'2025-05-08T14:50:06.3810213' AS DateTime2), 924, N'::1', NULL, N'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/135.0.0.0 Safari/537.36', NULL, NULL, NULL, 1, NULL)
GO
INSERT [dbo].[AbpAuditLogs] ([Id], [TenantId], [UserId], [ServiceName], [MethodName], [Parameters], [ReturnValue], [ExecutionTime], [ExecutionDuration], [ClientIpAddress], [ClientName], [BrowserInfo], [ExceptionMessage], [Exception], [ImpersonatorUserId], [ImpersonatorTenantId], [CustomData]) VALUES (296, 1, 4, N'Abp.AspNetCore.Mvc.Controllers.AbpUserConfigurationController', N'GetAll', N'{}', NULL, CAST(N'2025-05-08T14:50:08.5487053' AS DateTime2), 168, N'::1', NULL, N'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/135.0.0.0 Safari/537.36', NULL, NULL, NULL, 1, NULL)
GO
INSERT [dbo].[AbpAuditLogs] ([Id], [TenantId], [UserId], [ServiceName], [MethodName], [Parameters], [ReturnValue], [ExecutionTime], [ExecutionDuration], [ClientIpAddress], [ClientName], [BrowserInfo], [ExceptionMessage], [Exception], [ImpersonatorUserId], [ImpersonatorTenantId], [CustomData]) VALUES (297, 1, 4, N'School.LMS.StudentEducationalPayment.StudentPaymentAppService', N'GetStudentByName', N'{"studentName":"Mohamed Abdelmonem"}', NULL, CAST(N'2025-05-08T14:50:13.4011752' AS DateTime2), 45, N'::1', NULL, N'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/135.0.0.0 Safari/537.36', NULL, NULL, NULL, 1, NULL)
GO
INSERT [dbo].[AbpAuditLogs] ([Id], [TenantId], [UserId], [ServiceName], [MethodName], [Parameters], [ReturnValue], [ExecutionTime], [ExecutionDuration], [ClientIpAddress], [ClientName], [BrowserInfo], [ExceptionMessage], [Exception], [ImpersonatorUserId], [ImpersonatorTenantId], [CustomData]) VALUES (298, 1, 4, N'School.LMS.StudentEducationalPayment.StudentPaymentAppService', N'GetStudentPaymentDetailsAsync', N'{"studentId":"436"}', NULL, CAST(N'2025-05-08T14:50:13.6283014' AS DateTime2), 18354, N'::1', NULL, N'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/135.0.0.0 Safari/537.36', NULL, NULL, NULL, 1, NULL)
GO
INSERT [dbo].[AbpAuditLogs] ([Id], [TenantId], [UserId], [ServiceName], [MethodName], [Parameters], [ReturnValue], [ExecutionTime], [ExecutionDuration], [ClientIpAddress], [ClientName], [BrowserInfo], [ExceptionMessage], [Exception], [ImpersonatorUserId], [ImpersonatorTenantId], [CustomData]) VALUES (299, 1, 4, N'Abp.AspNetCore.Mvc.Controllers.AbpUserConfigurationController', N'GetAll', N'{}', NULL, CAST(N'2025-05-08T14:55:48.5965503' AS DateTime2), 9, N'::1', NULL, N'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/135.0.0.0 Safari/537.36', NULL, NULL, NULL, 1, NULL)
GO
INSERT [dbo].[AbpAuditLogs] ([Id], [TenantId], [UserId], [ServiceName], [MethodName], [Parameters], [ReturnValue], [ExecutionTime], [ExecutionDuration], [ClientIpAddress], [ClientName], [BrowserInfo], [ExceptionMessage], [Exception], [ImpersonatorUserId], [ImpersonatorTenantId], [CustomData]) VALUES (300, 1, 4, N'School.LMS.StudentEducationalPayment.StudentPaymentAppService', N'GetStudentByName', N'{"studentName":"Mohamed Abdelmonem"}', NULL, CAST(N'2025-05-08T14:56:53.3947210' AS DateTime2), 17, N'::1', NULL, N'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/135.0.0.0 Safari/537.36', NULL, NULL, NULL, 1, NULL)
GO
INSERT [dbo].[AbpAuditLogs] ([Id], [TenantId], [UserId], [ServiceName], [MethodName], [Parameters], [ReturnValue], [ExecutionTime], [ExecutionDuration], [ClientIpAddress], [ClientName], [BrowserInfo], [ExceptionMessage], [Exception], [ImpersonatorUserId], [ImpersonatorTenantId], [CustomData]) VALUES (301, 1, 4, N'School.LMS.StudentEducationalPayment.StudentPaymentAppService', N'GetStudentPaymentDetailsAsync', N'{"studentId":"436"}', NULL, CAST(N'2025-05-08T14:56:53.5211242' AS DateTime2), 39, N'::1', NULL, N'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/135.0.0.0 Safari/537.36', NULL, NULL, NULL, 1, NULL)
GO
INSERT [dbo].[AbpAuditLogs] ([Id], [TenantId], [UserId], [ServiceName], [MethodName], [Parameters], [ReturnValue], [ExecutionTime], [ExecutionDuration], [ClientIpAddress], [ClientName], [BrowserInfo], [ExceptionMessage], [Exception], [ImpersonatorUserId], [ImpersonatorTenantId], [CustomData]) VALUES (302, 1, 4, N'Abp.AspNetCore.Mvc.Controllers.AbpUserConfigurationController', N'GetAll', N'{}', NULL, CAST(N'2025-05-08T14:59:53.7218414' AS DateTime2), 9, N'::1', NULL, N'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/135.0.0.0 Safari/537.36', NULL, NULL, NULL, 1, NULL)
GO
INSERT [dbo].[AbpAuditLogs] ([Id], [TenantId], [UserId], [ServiceName], [MethodName], [Parameters], [ReturnValue], [ExecutionTime], [ExecutionDuration], [ClientIpAddress], [ClientName], [BrowserInfo], [ExceptionMessage], [Exception], [ImpersonatorUserId], [ImpersonatorTenantId], [CustomData]) VALUES (303, 1, 4, N'School.LMS.StudentEducationalPayment.StudentPaymentAppService', N'GetStudentByName', N'{"studentName":"Mohamed Abdelmonem"}', NULL, CAST(N'2025-05-08T15:02:34.9198463' AS DateTime2), 114, N'::1', NULL, N'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/135.0.0.0 Safari/537.36', NULL, NULL, NULL, 1, NULL)
GO
INSERT [dbo].[AbpAuditLogs] ([Id], [TenantId], [UserId], [ServiceName], [MethodName], [Parameters], [ReturnValue], [ExecutionTime], [ExecutionDuration], [ClientIpAddress], [ClientName], [BrowserInfo], [ExceptionMessage], [Exception], [ImpersonatorUserId], [ImpersonatorTenantId], [CustomData]) VALUES (304, 1, 4, N'School.LMS.StudentEducationalPayment.StudentPaymentAppService', N'GetStudentPaymentDetailsAsync', N'{"studentId":"436"}', NULL, CAST(N'2025-05-08T15:02:35.1389093' AS DateTime2), 60, N'::1', NULL, N'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/135.0.0.0 Safari/537.36', NULL, NULL, NULL, 1, NULL)
GO
INSERT [dbo].[AbpAuditLogs] ([Id], [TenantId], [UserId], [ServiceName], [MethodName], [Parameters], [ReturnValue], [ExecutionTime], [ExecutionDuration], [ClientIpAddress], [ClientName], [BrowserInfo], [ExceptionMessage], [Exception], [ImpersonatorUserId], [ImpersonatorTenantId], [CustomData]) VALUES (305, 1, 4, N'Abp.AspNetCore.Mvc.Controllers.AbpUserConfigurationController', N'GetAll', N'{}', NULL, CAST(N'2025-05-08T15:06:10.9667578' AS DateTime2), 14, N'::1', NULL, N'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/135.0.0.0 Safari/537.36', NULL, NULL, NULL, 1, NULL)
GO
INSERT [dbo].[AbpAuditLogs] ([Id], [TenantId], [UserId], [ServiceName], [MethodName], [Parameters], [ReturnValue], [ExecutionTime], [ExecutionDuration], [ClientIpAddress], [ClientName], [BrowserInfo], [ExceptionMessage], [Exception], [ImpersonatorUserId], [ImpersonatorTenantId], [CustomData]) VALUES (306, 1, 4, N'School.LMS.StudentEducationalPayment.StudentPaymentAppService', N'GetStudentByName', N'{"studentName":"Mohamed Abdelmonem"}', NULL, CAST(N'2025-05-08T15:06:11.2814855' AS DateTime2), 12, N'::1', NULL, N'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/135.0.0.0 Safari/537.36', NULL, NULL, NULL, 1, NULL)
GO
INSERT [dbo].[AbpAuditLogs] ([Id], [TenantId], [UserId], [ServiceName], [MethodName], [Parameters], [ReturnValue], [ExecutionTime], [ExecutionDuration], [ClientIpAddress], [ClientName], [BrowserInfo], [ExceptionMessage], [Exception], [ImpersonatorUserId], [ImpersonatorTenantId], [CustomData]) VALUES (307, 1, 4, N'School.LMS.StudentEducationalPayment.StudentPaymentAppService', N'GetStudentPaymentDetailsAsync', N'{"studentId":"436"}', NULL, CAST(N'2025-05-08T15:06:11.4065586' AS DateTime2), 56, N'::1', NULL, N'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/135.0.0.0 Safari/537.36', NULL, NULL, NULL, 1, NULL)
GO
INSERT [dbo].[AbpAuditLogs] ([Id], [TenantId], [UserId], [ServiceName], [MethodName], [Parameters], [ReturnValue], [ExecutionTime], [ExecutionDuration], [ClientIpAddress], [ClientName], [BrowserInfo], [ExceptionMessage], [Exception], [ImpersonatorUserId], [ImpersonatorTenantId], [CustomData]) VALUES (308, 1, 4, N'Abp.AspNetCore.Mvc.Controllers.AbpUserConfigurationController', N'GetAll', N'{}', NULL, CAST(N'2025-05-08T15:07:43.2447624' AS DateTime2), 3, N'::1', NULL, N'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/135.0.0.0 Safari/537.36', NULL, NULL, NULL, 1, NULL)
GO
INSERT [dbo].[AbpAuditLogs] ([Id], [TenantId], [UserId], [ServiceName], [MethodName], [Parameters], [ReturnValue], [ExecutionTime], [ExecutionDuration], [ClientIpAddress], [ClientName], [BrowserInfo], [ExceptionMessage], [Exception], [ImpersonatorUserId], [ImpersonatorTenantId], [CustomData]) VALUES (309, 1, 4, N'School.LMS.StudentEducationalPayment.StudentPaymentAppService', N'GetStudentByName', N'{"studentName":"Mohamed Abdelmonem"}', NULL, CAST(N'2025-05-08T15:07:43.4053241' AS DateTime2), 31, N'::1', NULL, N'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/135.0.0.0 Safari/537.36', NULL, NULL, NULL, 1, NULL)
GO
INSERT [dbo].[AbpAuditLogs] ([Id], [TenantId], [UserId], [ServiceName], [MethodName], [Parameters], [ReturnValue], [ExecutionTime], [ExecutionDuration], [ClientIpAddress], [ClientName], [BrowserInfo], [ExceptionMessage], [Exception], [ImpersonatorUserId], [ImpersonatorTenantId], [CustomData]) VALUES (310, 1, 4, N'School.LMS.StudentEducationalPayment.StudentPaymentAppService', N'GetStudentPaymentDetailsAsync', N'{"studentId":"436"}', NULL, CAST(N'2025-05-08T15:07:43.5318665' AS DateTime2), 62, N'::1', NULL, N'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/135.0.0.0 Safari/537.36', NULL, NULL, NULL, 1, NULL)
GO
INSERT [dbo].[AbpAuditLogs] ([Id], [TenantId], [UserId], [ServiceName], [MethodName], [Parameters], [ReturnValue], [ExecutionTime], [ExecutionDuration], [ClientIpAddress], [ClientName], [BrowserInfo], [ExceptionMessage], [Exception], [ImpersonatorUserId], [ImpersonatorTenantId], [CustomData]) VALUES (311, 1, 4, N'Abp.AspNetCore.Mvc.Controllers.AbpUserConfigurationController', N'GetAll', N'{}', NULL, CAST(N'2025-05-08T15:08:31.5126160' AS DateTime2), 3, N'::1', NULL, N'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/135.0.0.0 Safari/537.36', NULL, NULL, NULL, 1, NULL)
GO
INSERT [dbo].[AbpAuditLogs] ([Id], [TenantId], [UserId], [ServiceName], [MethodName], [Parameters], [ReturnValue], [ExecutionTime], [ExecutionDuration], [ClientIpAddress], [ClientName], [BrowserInfo], [ExceptionMessage], [Exception], [ImpersonatorUserId], [ImpersonatorTenantId], [CustomData]) VALUES (312, 1, 4, N'School.LMS.StudentEducationalPayment.StudentPaymentAppService', N'GetStudentByName', N'{"studentName":"Mohamed Abdelmonem"}', NULL, CAST(N'2025-05-08T15:08:31.7373420' AS DateTime2), 46, N'::1', NULL, N'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/135.0.0.0 Safari/537.36', NULL, NULL, NULL, 1, NULL)
GO
INSERT [dbo].[AbpAuditLogs] ([Id], [TenantId], [UserId], [ServiceName], [MethodName], [Parameters], [ReturnValue], [ExecutionTime], [ExecutionDuration], [ClientIpAddress], [ClientName], [BrowserInfo], [ExceptionMessage], [Exception], [ImpersonatorUserId], [ImpersonatorTenantId], [CustomData]) VALUES (313, 1, 4, N'School.LMS.StudentEducationalPayment.StudentPaymentAppService', N'GetStudentPaymentDetailsAsync', N'{"studentId":"436"}', NULL, CAST(N'2025-05-08T15:08:31.8559581' AS DateTime2), 39, N'::1', NULL, N'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/135.0.0.0 Safari/537.36', NULL, NULL, NULL, 1, NULL)
GO
INSERT [dbo].[AbpAuditLogs] ([Id], [TenantId], [UserId], [ServiceName], [MethodName], [Parameters], [ReturnValue], [ExecutionTime], [ExecutionDuration], [ClientIpAddress], [ClientName], [BrowserInfo], [ExceptionMessage], [Exception], [ImpersonatorUserId], [ImpersonatorTenantId], [CustomData]) VALUES (314, 1, 4, N'Abp.AspNetCore.Mvc.Controllers.AbpUserConfigurationController', N'GetAll', N'{}', NULL, CAST(N'2025-05-08T15:08:55.4144385' AS DateTime2), 9, N'::1', NULL, N'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/135.0.0.0 Safari/537.36', NULL, NULL, NULL, 1, NULL)
GO
INSERT [dbo].[AbpAuditLogs] ([Id], [TenantId], [UserId], [ServiceName], [MethodName], [Parameters], [ReturnValue], [ExecutionTime], [ExecutionDuration], [ClientIpAddress], [ClientName], [BrowserInfo], [ExceptionMessage], [Exception], [ImpersonatorUserId], [ImpersonatorTenantId], [CustomData]) VALUES (315, 1, 4, N'School.LMS.StudentEducationalPayment.StudentPaymentAppService', N'GetStudentByName', N'{"studentName":"Mohamed Abdelmonem"}', NULL, CAST(N'2025-05-08T15:09:11.5509766' AS DateTime2), 18, N'::1', NULL, N'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/135.0.0.0 Safari/537.36', NULL, NULL, NULL, 1, NULL)
GO
INSERT [dbo].[AbpAuditLogs] ([Id], [TenantId], [UserId], [ServiceName], [MethodName], [Parameters], [ReturnValue], [ExecutionTime], [ExecutionDuration], [ClientIpAddress], [ClientName], [BrowserInfo], [ExceptionMessage], [Exception], [ImpersonatorUserId], [ImpersonatorTenantId], [CustomData]) VALUES (316, 1, 4, N'School.LMS.StudentEducationalPayment.StudentPaymentAppService', N'GetStudentPaymentDetailsAsync', N'{"studentId":"436"}', NULL, CAST(N'2025-05-08T15:09:11.7239521' AS DateTime2), 52, N'::1', NULL, N'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/135.0.0.0 Safari/537.36', NULL, NULL, NULL, 1, NULL)
GO
INSERT [dbo].[AbpAuditLogs] ([Id], [TenantId], [UserId], [ServiceName], [MethodName], [Parameters], [ReturnValue], [ExecutionTime], [ExecutionDuration], [ClientIpAddress], [ClientName], [BrowserInfo], [ExceptionMessage], [Exception], [ImpersonatorUserId], [ImpersonatorTenantId], [CustomData]) VALUES (317, 1, 4, N'Abp.AspNetCore.Mvc.Controllers.AbpUserConfigurationController', N'GetAll', N'{}', NULL, CAST(N'2025-05-08T15:10:20.0229887' AS DateTime2), 5, N'::1', NULL, N'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/135.0.0.0 Safari/537.36', NULL, NULL, NULL, 1, NULL)
GO
INSERT [dbo].[AbpAuditLogs] ([Id], [TenantId], [UserId], [ServiceName], [MethodName], [Parameters], [ReturnValue], [ExecutionTime], [ExecutionDuration], [ClientIpAddress], [ClientName], [BrowserInfo], [ExceptionMessage], [Exception], [ImpersonatorUserId], [ImpersonatorTenantId], [CustomData]) VALUES (318, 1, 4, N'School.LMS.StudentEducationalPayment.StudentPaymentAppService', N'GetStudentByName', N'{"studentName":"Mohamed Abdelmonem"}', NULL, CAST(N'2025-05-08T15:10:20.3944540' AS DateTime2), 9, N'::1', NULL, N'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/135.0.0.0 Safari/537.36', NULL, NULL, NULL, 1, NULL)
GO
INSERT [dbo].[AbpAuditLogs] ([Id], [TenantId], [UserId], [ServiceName], [MethodName], [Parameters], [ReturnValue], [ExecutionTime], [ExecutionDuration], [ClientIpAddress], [ClientName], [BrowserInfo], [ExceptionMessage], [Exception], [ImpersonatorUserId], [ImpersonatorTenantId], [CustomData]) VALUES (319, 1, 4, N'School.LMS.StudentEducationalPayment.StudentPaymentAppService', N'GetStudentPaymentDetailsAsync', N'{"studentId":"436"}', NULL, CAST(N'2025-05-08T15:10:20.5164597' AS DateTime2), 39, N'::1', NULL, N'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/135.0.0.0 Safari/537.36', NULL, NULL, NULL, 1, NULL)
GO
INSERT [dbo].[AbpAuditLogs] ([Id], [TenantId], [UserId], [ServiceName], [MethodName], [Parameters], [ReturnValue], [ExecutionTime], [ExecutionDuration], [ClientIpAddress], [ClientName], [BrowserInfo], [ExceptionMessage], [Exception], [ImpersonatorUserId], [ImpersonatorTenantId], [CustomData]) VALUES (320, 1, 4, N'Abp.AspNetCore.Mvc.Controllers.AbpUserConfigurationController', N'GetAll', N'{}', NULL, CAST(N'2025-05-08T15:11:11.3007834' AS DateTime2), 5, N'::1', NULL, N'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/135.0.0.0 Safari/537.36', NULL, NULL, NULL, 1, NULL)
GO
INSERT [dbo].[AbpAuditLogs] ([Id], [TenantId], [UserId], [ServiceName], [MethodName], [Parameters], [ReturnValue], [ExecutionTime], [ExecutionDuration], [ClientIpAddress], [ClientName], [BrowserInfo], [ExceptionMessage], [Exception], [ImpersonatorUserId], [ImpersonatorTenantId], [CustomData]) VALUES (321, 1, 4, N'School.LMS.StudentEducationalPayment.StudentPaymentAppService', N'GetStudentByName', N'{"studentName":"Mohamed Abdelmonem"}', NULL, CAST(N'2025-05-08T15:11:11.5491404' AS DateTime2), 9, N'::1', NULL, N'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/135.0.0.0 Safari/537.36', NULL, NULL, NULL, 1, NULL)
GO
INSERT [dbo].[AbpAuditLogs] ([Id], [TenantId], [UserId], [ServiceName], [MethodName], [Parameters], [ReturnValue], [ExecutionTime], [ExecutionDuration], [ClientIpAddress], [ClientName], [BrowserInfo], [ExceptionMessage], [Exception], [ImpersonatorUserId], [ImpersonatorTenantId], [CustomData]) VALUES (322, 1, 4, N'School.LMS.StudentEducationalPayment.StudentPaymentAppService', N'GetStudentPaymentDetailsAsync', N'{"studentId":"436"}', NULL, CAST(N'2025-05-08T15:11:11.6229472' AS DateTime2), 42, N'::1', NULL, N'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/135.0.0.0 Safari/537.36', NULL, NULL, NULL, 1, NULL)
GO
INSERT [dbo].[AbpAuditLogs] ([Id], [TenantId], [UserId], [ServiceName], [MethodName], [Parameters], [ReturnValue], [ExecutionTime], [ExecutionDuration], [ClientIpAddress], [ClientName], [BrowserInfo], [ExceptionMessage], [Exception], [ImpersonatorUserId], [ImpersonatorTenantId], [CustomData]) VALUES (323, 1, 4, N'Abp.AspNetCore.Mvc.Controllers.AbpUserConfigurationController', N'GetAll', N'{}', NULL, CAST(N'2025-05-08T15:11:20.0627513' AS DateTime2), 5, N'::1', NULL, N'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/135.0.0.0 Safari/537.36', NULL, NULL, NULL, 1, NULL)
GO
INSERT [dbo].[AbpAuditLogs] ([Id], [TenantId], [UserId], [ServiceName], [MethodName], [Parameters], [ReturnValue], [ExecutionTime], [ExecutionDuration], [ClientIpAddress], [ClientName], [BrowserInfo], [ExceptionMessage], [Exception], [ImpersonatorUserId], [ImpersonatorTenantId], [CustomData]) VALUES (324, 1, 4, N'School.LMS.StudentEducationalPayment.StudentPaymentAppService', N'GetStudentByName', N'{"studentName":"Mohamed Abdelmonem"}', NULL, CAST(N'2025-05-08T15:11:20.2681046' AS DateTime2), 8, N'::1', NULL, N'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/135.0.0.0 Safari/537.36', NULL, NULL, NULL, 1, NULL)
GO
INSERT [dbo].[AbpAuditLogs] ([Id], [TenantId], [UserId], [ServiceName], [MethodName], [Parameters], [ReturnValue], [ExecutionTime], [ExecutionDuration], [ClientIpAddress], [ClientName], [BrowserInfo], [ExceptionMessage], [Exception], [ImpersonatorUserId], [ImpersonatorTenantId], [CustomData]) VALUES (325, 1, 4, N'School.LMS.StudentEducationalPayment.StudentPaymentAppService', N'GetStudentPaymentDetailsAsync', N'{"studentId":"436"}', NULL, CAST(N'2025-05-08T15:11:20.3906585' AS DateTime2), 40, N'::1', NULL, N'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/135.0.0.0 Safari/537.36', NULL, NULL, NULL, 1, NULL)
GO
INSERT [dbo].[AbpAuditLogs] ([Id], [TenantId], [UserId], [ServiceName], [MethodName], [Parameters], [ReturnValue], [ExecutionTime], [ExecutionDuration], [ClientIpAddress], [ClientName], [BrowserInfo], [ExceptionMessage], [Exception], [ImpersonatorUserId], [ImpersonatorTenantId], [CustomData]) VALUES (326, 1, 4, N'Abp.AspNetCore.Mvc.Controllers.AbpUserConfigurationController', N'GetAll', N'{}', NULL, CAST(N'2025-05-08T15:13:05.2536515' AS DateTime2), 9, N'::1', NULL, N'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/135.0.0.0 Safari/537.36', NULL, NULL, NULL, 1, NULL)
GO
INSERT [dbo].[AbpAuditLogs] ([Id], [TenantId], [UserId], [ServiceName], [MethodName], [Parameters], [ReturnValue], [ExecutionTime], [ExecutionDuration], [ClientIpAddress], [ClientName], [BrowserInfo], [ExceptionMessage], [Exception], [ImpersonatorUserId], [ImpersonatorTenantId], [CustomData]) VALUES (327, 1, 4, N'School.LMS.StudentEducationalPayment.StudentPaymentAppService', N'GetStudentByName', N'{"studentName":"Mohamed Abdelmonem"}', NULL, CAST(N'2025-05-08T15:13:05.5300650' AS DateTime2), 18, N'::1', NULL, N'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/135.0.0.0 Safari/537.36', NULL, NULL, NULL, 1, NULL)
GO
INSERT [dbo].[AbpAuditLogs] ([Id], [TenantId], [UserId], [ServiceName], [MethodName], [Parameters], [ReturnValue], [ExecutionTime], [ExecutionDuration], [ClientIpAddress], [ClientName], [BrowserInfo], [ExceptionMessage], [Exception], [ImpersonatorUserId], [ImpersonatorTenantId], [CustomData]) VALUES (328, 1, 4, N'School.LMS.StudentEducationalPayment.StudentPaymentAppService', N'GetStudentPaymentDetailsAsync', N'{"studentId":"436"}', NULL, CAST(N'2025-05-08T15:13:05.6665444' AS DateTime2), 73, N'::1', NULL, N'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/135.0.0.0 Safari/537.36', NULL, NULL, NULL, 1, NULL)
GO
INSERT [dbo].[AbpAuditLogs] ([Id], [TenantId], [UserId], [ServiceName], [MethodName], [Parameters], [ReturnValue], [ExecutionTime], [ExecutionDuration], [ClientIpAddress], [ClientName], [BrowserInfo], [ExceptionMessage], [Exception], [ImpersonatorUserId], [ImpersonatorTenantId], [CustomData]) VALUES (329, 1, 4, N'Abp.AspNetCore.Mvc.Controllers.AbpUserConfigurationController', N'GetAll', N'{}', NULL, CAST(N'2025-05-08T15:13:59.2856366' AS DateTime2), 6, N'::1', NULL, N'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/135.0.0.0 Safari/537.36', NULL, NULL, NULL, 1, NULL)
GO
INSERT [dbo].[AbpAuditLogs] ([Id], [TenantId], [UserId], [ServiceName], [MethodName], [Parameters], [ReturnValue], [ExecutionTime], [ExecutionDuration], [ClientIpAddress], [ClientName], [BrowserInfo], [ExceptionMessage], [Exception], [ImpersonatorUserId], [ImpersonatorTenantId], [CustomData]) VALUES (330, 1, 4, N'School.LMS.StudentEducationalPayment.StudentPaymentAppService', N'GetStudentByName', N'{"studentName":"Mohamed Abdelmonem"}', NULL, CAST(N'2025-05-08T15:13:59.6055871' AS DateTime2), 19, N'::1', NULL, N'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/135.0.0.0 Safari/537.36', NULL, NULL, NULL, 1, NULL)
GO
INSERT [dbo].[AbpAuditLogs] ([Id], [TenantId], [UserId], [ServiceName], [MethodName], [Parameters], [ReturnValue], [ExecutionTime], [ExecutionDuration], [ClientIpAddress], [ClientName], [BrowserInfo], [ExceptionMessage], [Exception], [ImpersonatorUserId], [ImpersonatorTenantId], [CustomData]) VALUES (331, 1, 4, N'School.LMS.StudentEducationalPayment.StudentPaymentAppService', N'GetStudentPaymentDetailsAsync', N'{"studentId":"436"}', NULL, CAST(N'2025-05-08T15:13:59.7346637' AS DateTime2), 85, N'::1', NULL, N'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/135.0.0.0 Safari/537.36', NULL, NULL, NULL, 1, NULL)
GO
INSERT [dbo].[AbpAuditLogs] ([Id], [TenantId], [UserId], [ServiceName], [MethodName], [Parameters], [ReturnValue], [ExecutionTime], [ExecutionDuration], [ClientIpAddress], [ClientName], [BrowserInfo], [ExceptionMessage], [Exception], [ImpersonatorUserId], [ImpersonatorTenantId], [CustomData]) VALUES (332, 1, 4, N'Abp.AspNetCore.Mvc.Controllers.AbpUserConfigurationController', N'GetAll', N'{}', NULL, CAST(N'2025-05-08T15:14:20.5808107' AS DateTime2), 5, N'::1', NULL, N'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/135.0.0.0 Safari/537.36', NULL, NULL, NULL, 1, NULL)
GO
INSERT [dbo].[AbpAuditLogs] ([Id], [TenantId], [UserId], [ServiceName], [MethodName], [Parameters], [ReturnValue], [ExecutionTime], [ExecutionDuration], [ClientIpAddress], [ClientName], [BrowserInfo], [ExceptionMessage], [Exception], [ImpersonatorUserId], [ImpersonatorTenantId], [CustomData]) VALUES (333, 1, 4, N'School.LMS.StudentEducationalPayment.StudentPaymentAppService', N'GetStudentByName', N'{"studentName":"Mohamed Abdelmonem"}', NULL, CAST(N'2025-05-08T15:14:20.8542260' AS DateTime2), 17, N'::1', NULL, N'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/135.0.0.0 Safari/537.36', NULL, NULL, NULL, 1, NULL)
GO
INSERT [dbo].[AbpAuditLogs] ([Id], [TenantId], [UserId], [ServiceName], [MethodName], [Parameters], [ReturnValue], [ExecutionTime], [ExecutionDuration], [ClientIpAddress], [ClientName], [BrowserInfo], [ExceptionMessage], [Exception], [ImpersonatorUserId], [ImpersonatorTenantId], [CustomData]) VALUES (334, 1, 4, N'School.LMS.StudentEducationalPayment.StudentPaymentAppService', N'GetStudentPaymentDetailsAsync', N'{"studentId":"436"}', NULL, CAST(N'2025-05-08T15:14:20.9438856' AS DateTime2), 20, N'::1', NULL, N'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/135.0.0.0 Safari/537.36', NULL, NULL, NULL, 1, NULL)
GO
INSERT [dbo].[AbpAuditLogs] ([Id], [TenantId], [UserId], [ServiceName], [MethodName], [Parameters], [ReturnValue], [ExecutionTime], [ExecutionDuration], [ClientIpAddress], [ClientName], [BrowserInfo], [ExceptionMessage], [Exception], [ImpersonatorUserId], [ImpersonatorTenantId], [CustomData]) VALUES (335, 1, 4, N'Abp.AspNetCore.Mvc.Controllers.AbpUserConfigurationController', N'GetAll', N'{}', NULL, CAST(N'2025-05-08T15:18:33.6336630' AS DateTime2), 6, N'::1', NULL, N'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/135.0.0.0 Safari/537.36', NULL, NULL, NULL, 1, NULL)
GO
INSERT [dbo].[AbpAuditLogs] ([Id], [TenantId], [UserId], [ServiceName], [MethodName], [Parameters], [ReturnValue], [ExecutionTime], [ExecutionDuration], [ClientIpAddress], [ClientName], [BrowserInfo], [ExceptionMessage], [Exception], [ImpersonatorUserId], [ImpersonatorTenantId], [CustomData]) VALUES (336, 1, 4, N'School.LMS.StudentEducationalPayment.StudentPaymentAppService', N'GetStudentByName', N'{"studentName":"Mohamed Abdelmonem"}', NULL, CAST(N'2025-05-08T15:18:33.9133077' AS DateTime2), 11, N'::1', NULL, N'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/135.0.0.0 Safari/537.36', NULL, NULL, NULL, 1, NULL)
GO
INSERT [dbo].[AbpAuditLogs] ([Id], [TenantId], [UserId], [ServiceName], [MethodName], [Parameters], [ReturnValue], [ExecutionTime], [ExecutionDuration], [ClientIpAddress], [ClientName], [BrowserInfo], [ExceptionMessage], [Exception], [ImpersonatorUserId], [ImpersonatorTenantId], [CustomData]) VALUES (337, 1, 4, N'School.LMS.StudentEducationalPayment.StudentPaymentAppService', N'GetStudentPaymentDetailsAsync', N'{"studentId":"436"}', NULL, CAST(N'2025-05-08T15:18:34.0127087' AS DateTime2), 41, N'::1', NULL, N'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/135.0.0.0 Safari/537.36', NULL, NULL, NULL, 1, NULL)
GO
INSERT [dbo].[AbpAuditLogs] ([Id], [TenantId], [UserId], [ServiceName], [MethodName], [Parameters], [ReturnValue], [ExecutionTime], [ExecutionDuration], [ClientIpAddress], [ClientName], [BrowserInfo], [ExceptionMessage], [Exception], [ImpersonatorUserId], [ImpersonatorTenantId], [CustomData]) VALUES (338, 1, 4, N'Abp.AspNetCore.Mvc.Controllers.AbpUserConfigurationController', N'GetAll', N'{}', NULL, CAST(N'2025-05-08T15:20:36.3477944' AS DateTime2), 6, N'::1', NULL, N'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/135.0.0.0 Safari/537.36', NULL, NULL, NULL, 1, NULL)
GO
INSERT [dbo].[AbpAuditLogs] ([Id], [TenantId], [UserId], [ServiceName], [MethodName], [Parameters], [ReturnValue], [ExecutionTime], [ExecutionDuration], [ClientIpAddress], [ClientName], [BrowserInfo], [ExceptionMessage], [Exception], [ImpersonatorUserId], [ImpersonatorTenantId], [CustomData]) VALUES (339, 1, 4, N'School.LMS.StudentEducationalPayment.StudentPaymentAppService', N'GetStudentByName', N'{"studentName":"Mohamed Abdelmonem"}', NULL, CAST(N'2025-05-08T15:20:36.5588987' AS DateTime2), 9, N'::1', NULL, N'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/135.0.0.0 Safari/537.36', NULL, NULL, NULL, 1, NULL)
GO
INSERT [dbo].[AbpAuditLogs] ([Id], [TenantId], [UserId], [ServiceName], [MethodName], [Parameters], [ReturnValue], [ExecutionTime], [ExecutionDuration], [ClientIpAddress], [ClientName], [BrowserInfo], [ExceptionMessage], [Exception], [ImpersonatorUserId], [ImpersonatorTenantId], [CustomData]) VALUES (340, 1, 4, N'School.LMS.StudentEducationalPayment.StudentPaymentAppService', N'GetStudentPaymentDetailsAsync', N'{"studentId":"436"}', NULL, CAST(N'2025-05-08T15:20:36.6572725' AS DateTime2), 76, N'::1', NULL, N'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/135.0.0.0 Safari/537.36', NULL, NULL, NULL, 1, NULL)
GO
INSERT [dbo].[AbpAuditLogs] ([Id], [TenantId], [UserId], [ServiceName], [MethodName], [Parameters], [ReturnValue], [ExecutionTime], [ExecutionDuration], [ClientIpAddress], [ClientName], [BrowserInfo], [ExceptionMessage], [Exception], [ImpersonatorUserId], [ImpersonatorTenantId], [CustomData]) VALUES (341, 1, 4, N'Abp.AspNetCore.Mvc.Controllers.AbpUserConfigurationController', N'GetAll', N'{}', NULL, CAST(N'2025-05-08T15:21:18.9285527' AS DateTime2), 4, N'::1', NULL, N'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/135.0.0.0 Safari/537.36', NULL, NULL, NULL, 1, NULL)
GO
INSERT [dbo].[AbpAuditLogs] ([Id], [TenantId], [UserId], [ServiceName], [MethodName], [Parameters], [ReturnValue], [ExecutionTime], [ExecutionDuration], [ClientIpAddress], [ClientName], [BrowserInfo], [ExceptionMessage], [Exception], [ImpersonatorUserId], [ImpersonatorTenantId], [CustomData]) VALUES (342, 1, 4, N'School.LMS.StudentEducationalPayment.StudentPaymentAppService', N'GetStudentByName', N'{"studentName":"Mohamed Abdelmonem"}', NULL, CAST(N'2025-05-08T15:21:19.1505478' AS DateTime2), 51, N'::1', NULL, N'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/135.0.0.0 Safari/537.36', NULL, NULL, NULL, 1, NULL)
GO
INSERT [dbo].[AbpAuditLogs] ([Id], [TenantId], [UserId], [ServiceName], [MethodName], [Parameters], [ReturnValue], [ExecutionTime], [ExecutionDuration], [ClientIpAddress], [ClientName], [BrowserInfo], [ExceptionMessage], [Exception], [ImpersonatorUserId], [ImpersonatorTenantId], [CustomData]) VALUES (343, 1, 4, N'School.LMS.StudentEducationalPayment.StudentPaymentAppService', N'GetStudentPaymentDetailsAsync', N'{"studentId":"436"}', NULL, CAST(N'2025-05-08T15:21:19.3349160' AS DateTime2), 48, N'::1', NULL, N'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/135.0.0.0 Safari/537.36', NULL, NULL, NULL, 1, NULL)
GO
INSERT [dbo].[AbpAuditLogs] ([Id], [TenantId], [UserId], [ServiceName], [MethodName], [Parameters], [ReturnValue], [ExecutionTime], [ExecutionDuration], [ClientIpAddress], [ClientName], [BrowserInfo], [ExceptionMessage], [Exception], [ImpersonatorUserId], [ImpersonatorTenantId], [CustomData]) VALUES (344, 1, 4, N'Abp.AspNetCore.Mvc.Controllers.AbpUserConfigurationController', N'GetAll', N'{}', NULL, CAST(N'2025-05-08T15:22:12.4971544' AS DateTime2), 7, N'::1', NULL, N'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/135.0.0.0 Safari/537.36', NULL, NULL, NULL, 1, NULL)
GO
INSERT [dbo].[AbpAuditLogs] ([Id], [TenantId], [UserId], [ServiceName], [MethodName], [Parameters], [ReturnValue], [ExecutionTime], [ExecutionDuration], [ClientIpAddress], [ClientName], [BrowserInfo], [ExceptionMessage], [Exception], [ImpersonatorUserId], [ImpersonatorTenantId], [CustomData]) VALUES (345, 1, 4, N'School.LMS.StudentEducationalPayment.StudentPaymentAppService', N'GetStudentByName', N'{"studentName":"Mohamed Abdelmonem"}', NULL, CAST(N'2025-05-08T15:22:12.7908385' AS DateTime2), 56, N'::1', NULL, N'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/135.0.0.0 Safari/537.36', NULL, NULL, NULL, 1, NULL)
GO
INSERT [dbo].[AbpAuditLogs] ([Id], [TenantId], [UserId], [ServiceName], [MethodName], [Parameters], [ReturnValue], [ExecutionTime], [ExecutionDuration], [ClientIpAddress], [ClientName], [BrowserInfo], [ExceptionMessage], [Exception], [ImpersonatorUserId], [ImpersonatorTenantId], [CustomData]) VALUES (346, 1, 4, N'School.LMS.StudentEducationalPayment.StudentPaymentAppService', N'GetStudentPaymentDetailsAsync', N'{"studentId":"436"}', NULL, CAST(N'2025-05-08T15:22:12.9587457' AS DateTime2), 83, N'::1', NULL, N'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/135.0.0.0 Safari/537.36', NULL, NULL, NULL, 1, NULL)
GO
INSERT [dbo].[AbpAuditLogs] ([Id], [TenantId], [UserId], [ServiceName], [MethodName], [Parameters], [ReturnValue], [ExecutionTime], [ExecutionDuration], [ClientIpAddress], [ClientName], [BrowserInfo], [ExceptionMessage], [Exception], [ImpersonatorUserId], [ImpersonatorTenantId], [CustomData]) VALUES (347, 1, 4, N'Abp.AspNetCore.Mvc.Controllers.AbpUserConfigurationController', N'GetAll', N'{}', NULL, CAST(N'2025-05-08T15:24:42.5339106' AS DateTime2), 6, N'::1', NULL, N'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/135.0.0.0 Safari/537.36', NULL, NULL, NULL, 1, NULL)
GO
INSERT [dbo].[AbpAuditLogs] ([Id], [TenantId], [UserId], [ServiceName], [MethodName], [Parameters], [ReturnValue], [ExecutionTime], [ExecutionDuration], [ClientIpAddress], [ClientName], [BrowserInfo], [ExceptionMessage], [Exception], [ImpersonatorUserId], [ImpersonatorTenantId], [CustomData]) VALUES (348, 1, 4, N'School.LMS.StudentEducationalPayment.StudentPaymentAppService', N'GetStudentByName', N'{"studentName":"Mohamed Abdelmonem"}', NULL, CAST(N'2025-05-08T15:24:42.7866930' AS DateTime2), 13, N'::1', NULL, N'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/135.0.0.0 Safari/537.36', NULL, NULL, NULL, 1, NULL)
GO
INSERT [dbo].[AbpAuditLogs] ([Id], [TenantId], [UserId], [ServiceName], [MethodName], [Parameters], [ReturnValue], [ExecutionTime], [ExecutionDuration], [ClientIpAddress], [ClientName], [BrowserInfo], [ExceptionMessage], [Exception], [ImpersonatorUserId], [ImpersonatorTenantId], [CustomData]) VALUES (349, 1, 4, N'School.LMS.StudentEducationalPayment.StudentPaymentAppService', N'GetStudentPaymentDetailsAsync', N'{"studentId":"436"}', NULL, CAST(N'2025-05-08T15:24:42.8843823' AS DateTime2), 66, N'::1', NULL, N'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/135.0.0.0 Safari/537.36', NULL, NULL, NULL, 1, NULL)
GO
INSERT [dbo].[AbpAuditLogs] ([Id], [TenantId], [UserId], [ServiceName], [MethodName], [Parameters], [ReturnValue], [ExecutionTime], [ExecutionDuration], [ClientIpAddress], [ClientName], [BrowserInfo], [ExceptionMessage], [Exception], [ImpersonatorUserId], [ImpersonatorTenantId], [CustomData]) VALUES (350, 1, 4, N'Abp.AspNetCore.Mvc.Controllers.AbpUserConfigurationController', N'GetAll', N'{}', NULL, CAST(N'2025-05-08T15:25:07.4613927' AS DateTime2), 4, N'::1', NULL, N'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/135.0.0.0 Safari/537.36', NULL, NULL, NULL, 1, NULL)
GO
INSERT [dbo].[AbpAuditLogs] ([Id], [TenantId], [UserId], [ServiceName], [MethodName], [Parameters], [ReturnValue], [ExecutionTime], [ExecutionDuration], [ClientIpAddress], [ClientName], [BrowserInfo], [ExceptionMessage], [Exception], [ImpersonatorUserId], [ImpersonatorTenantId], [CustomData]) VALUES (351, 1, 4, N'School.LMS.StudentEducationalPayment.StudentPaymentAppService', N'GetStudentByName', N'{"studentName":"Mohamed Abdelmonem"}', NULL, CAST(N'2025-05-08T15:25:07.7452111' AS DateTime2), 14, N'::1', NULL, N'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/135.0.0.0 Safari/537.36', NULL, NULL, NULL, 1, NULL)
GO
INSERT [dbo].[AbpAuditLogs] ([Id], [TenantId], [UserId], [ServiceName], [MethodName], [Parameters], [ReturnValue], [ExecutionTime], [ExecutionDuration], [ClientIpAddress], [ClientName], [BrowserInfo], [ExceptionMessage], [Exception], [ImpersonatorUserId], [ImpersonatorTenantId], [CustomData]) VALUES (352, 1, 4, N'School.LMS.StudentEducationalPayment.StudentPaymentAppService', N'GetStudentPaymentDetailsAsync', N'{"studentId":"436"}', NULL, CAST(N'2025-05-08T15:25:07.8339535' AS DateTime2), 62, N'::1', NULL, N'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/135.0.0.0 Safari/537.36', NULL, NULL, NULL, 1, NULL)
GO
INSERT [dbo].[AbpAuditLogs] ([Id], [TenantId], [UserId], [ServiceName], [MethodName], [Parameters], [ReturnValue], [ExecutionTime], [ExecutionDuration], [ClientIpAddress], [ClientName], [BrowserInfo], [ExceptionMessage], [Exception], [ImpersonatorUserId], [ImpersonatorTenantId], [CustomData]) VALUES (353, 1, 4, N'Abp.AspNetCore.Mvc.Controllers.AbpUserConfigurationController', N'GetAll', N'{}', NULL, CAST(N'2025-05-08T15:26:24.0211398' AS DateTime2), 7, N'::1', NULL, N'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/135.0.0.0 Safari/537.36', NULL, NULL, NULL, 1, NULL)
GO
INSERT [dbo].[AbpAuditLogs] ([Id], [TenantId], [UserId], [ServiceName], [MethodName], [Parameters], [ReturnValue], [ExecutionTime], [ExecutionDuration], [ClientIpAddress], [ClientName], [BrowserInfo], [ExceptionMessage], [Exception], [ImpersonatorUserId], [ImpersonatorTenantId], [CustomData]) VALUES (354, 1, 4, N'School.LMS.StudentEducationalPayment.StudentPaymentAppService', N'GetStudentByName', N'{"studentName":"Mohamed Abdelmonem"}', NULL, CAST(N'2025-05-08T15:26:24.2675961' AS DateTime2), 16, N'::1', NULL, N'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/135.0.0.0 Safari/537.36', NULL, NULL, NULL, 1, NULL)
GO
INSERT [dbo].[AbpAuditLogs] ([Id], [TenantId], [UserId], [ServiceName], [MethodName], [Parameters], [ReturnValue], [ExecutionTime], [ExecutionDuration], [ClientIpAddress], [ClientName], [BrowserInfo], [ExceptionMessage], [Exception], [ImpersonatorUserId], [ImpersonatorTenantId], [CustomData]) VALUES (355, 1, 4, N'School.LMS.StudentEducationalPayment.StudentPaymentAppService', N'GetStudentPaymentDetailsAsync', N'{"studentId":"436"}', NULL, CAST(N'2025-05-08T15:26:24.3719881' AS DateTime2), 37, N'::1', NULL, N'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/135.0.0.0 Safari/537.36', NULL, NULL, NULL, 1, NULL)
GO
INSERT [dbo].[AbpAuditLogs] ([Id], [TenantId], [UserId], [ServiceName], [MethodName], [Parameters], [ReturnValue], [ExecutionTime], [ExecutionDuration], [ClientIpAddress], [ClientName], [BrowserInfo], [ExceptionMessage], [Exception], [ImpersonatorUserId], [ImpersonatorTenantId], [CustomData]) VALUES (356, 1, 4, N'Abp.AspNetCore.Mvc.Controllers.AbpUserConfigurationController', N'GetAll', N'{}', NULL, CAST(N'2025-05-08T15:26:53.1111284' AS DateTime2), 4, N'::1', NULL, N'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/135.0.0.0 Safari/537.36', NULL, NULL, NULL, 1, NULL)
GO
INSERT [dbo].[AbpAuditLogs] ([Id], [TenantId], [UserId], [ServiceName], [MethodName], [Parameters], [ReturnValue], [ExecutionTime], [ExecutionDuration], [ClientIpAddress], [ClientName], [BrowserInfo], [ExceptionMessage], [Exception], [ImpersonatorUserId], [ImpersonatorTenantId], [CustomData]) VALUES (357, 1, 4, N'School.LMS.StudentEducationalPayment.StudentPaymentAppService', N'GetStudentByName', N'{"studentName":"Mohamed Abdelmonem"}', NULL, CAST(N'2025-05-08T15:26:53.4015650' AS DateTime2), 28, N'::1', NULL, N'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/135.0.0.0 Safari/537.36', NULL, NULL, NULL, 1, NULL)
GO
INSERT [dbo].[AbpAuditLogs] ([Id], [TenantId], [UserId], [ServiceName], [MethodName], [Parameters], [ReturnValue], [ExecutionTime], [ExecutionDuration], [ClientIpAddress], [ClientName], [BrowserInfo], [ExceptionMessage], [Exception], [ImpersonatorUserId], [ImpersonatorTenantId], [CustomData]) VALUES (358, 1, 4, N'School.LMS.StudentEducationalPayment.StudentPaymentAppService', N'GetStudentPaymentDetailsAsync', N'{"studentId":"436"}', NULL, CAST(N'2025-05-08T15:26:53.4929830' AS DateTime2), 40, N'::1', NULL, N'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/135.0.0.0 Safari/537.36', NULL, NULL, NULL, 1, NULL)
GO
INSERT [dbo].[AbpAuditLogs] ([Id], [TenantId], [UserId], [ServiceName], [MethodName], [Parameters], [ReturnValue], [ExecutionTime], [ExecutionDuration], [ClientIpAddress], [ClientName], [BrowserInfo], [ExceptionMessage], [Exception], [ImpersonatorUserId], [ImpersonatorTenantId], [CustomData]) VALUES (359, 1, 4, N'Abp.AspNetCore.Mvc.Controllers.AbpUserConfigurationController', N'GetAll', N'{}', NULL, CAST(N'2025-05-08T15:27:26.2876292' AS DateTime2), 7, N'::1', NULL, N'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/135.0.0.0 Safari/537.36', NULL, NULL, NULL, 1, NULL)
GO
INSERT [dbo].[AbpAuditLogs] ([Id], [TenantId], [UserId], [ServiceName], [MethodName], [Parameters], [ReturnValue], [ExecutionTime], [ExecutionDuration], [ClientIpAddress], [ClientName], [BrowserInfo], [ExceptionMessage], [Exception], [ImpersonatorUserId], [ImpersonatorTenantId], [CustomData]) VALUES (360, 1, 4, N'School.LMS.StudentEducationalPayment.StudentPaymentAppService', N'GetStudentByName', N'{"studentName":"Mohamed Abdelmonem"}', NULL, CAST(N'2025-05-08T15:27:26.5073725' AS DateTime2), 30, N'::1', NULL, N'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/135.0.0.0 Safari/537.36', NULL, NULL, NULL, 1, NULL)
GO
INSERT [dbo].[AbpAuditLogs] ([Id], [TenantId], [UserId], [ServiceName], [MethodName], [Parameters], [ReturnValue], [ExecutionTime], [ExecutionDuration], [ClientIpAddress], [ClientName], [BrowserInfo], [ExceptionMessage], [Exception], [ImpersonatorUserId], [ImpersonatorTenantId], [CustomData]) VALUES (361, 1, 4, N'School.LMS.StudentEducationalPayment.StudentPaymentAppService', N'GetStudentPaymentDetailsAsync', N'{"studentId":"436"}', NULL, CAST(N'2025-05-08T15:27:26.6257452' AS DateTime2), 31, N'::1', NULL, N'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/135.0.0.0 Safari/537.36', NULL, NULL, NULL, 1, NULL)
GO
INSERT [dbo].[AbpAuditLogs] ([Id], [TenantId], [UserId], [ServiceName], [MethodName], [Parameters], [ReturnValue], [ExecutionTime], [ExecutionDuration], [ClientIpAddress], [ClientName], [BrowserInfo], [ExceptionMessage], [Exception], [ImpersonatorUserId], [ImpersonatorTenantId], [CustomData]) VALUES (362, 1, 4, N'School.LMS.EducationalFeePlan.EducationFeeService', N'GetAllEducationalFees', N'{}', NULL, CAST(N'2025-05-08T15:27:29.6171150' AS DateTime2), 43, N'::1', NULL, N'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/135.0.0.0 Safari/537.36', NULL, NULL, NULL, 1, NULL)
GO
INSERT [dbo].[AbpAuditLogs] ([Id], [TenantId], [UserId], [ServiceName], [MethodName], [Parameters], [ReturnValue], [ExecutionTime], [ExecutionDuration], [ClientIpAddress], [ClientName], [BrowserInfo], [ExceptionMessage], [Exception], [ImpersonatorUserId], [ImpersonatorTenantId], [CustomData]) VALUES (363, 1, 4, N'School.LMS.EducationalFeePlan.EducationFeeService', N'GetAllEducationalFees', N'{}', NULL, CAST(N'2025-05-08T15:27:29.6108353' AS DateTime2), 51, N'::1', NULL, N'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/135.0.0.0 Safari/537.36', NULL, NULL, NULL, 1, NULL)
GO
INSERT [dbo].[AbpAuditLogs] ([Id], [TenantId], [UserId], [ServiceName], [MethodName], [Parameters], [ReturnValue], [ExecutionTime], [ExecutionDuration], [ClientIpAddress], [ClientName], [BrowserInfo], [ExceptionMessage], [Exception], [ImpersonatorUserId], [ImpersonatorTenantId], [CustomData]) VALUES (364, 1, 4, N'School.LMS.Students.StudentImportService', N'GetAllAsync', N'{"input":{"keyword":null}}', NULL, CAST(N'2025-05-08T15:27:29.5965476' AS DateTime2), 39, N'::1', NULL, N'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/135.0.0.0 Safari/537.36', NULL, NULL, NULL, 1, NULL)
GO
INSERT [dbo].[AbpAuditLogs] ([Id], [TenantId], [UserId], [ServiceName], [MethodName], [Parameters], [ReturnValue], [ExecutionTime], [ExecutionDuration], [ClientIpAddress], [ClientName], [BrowserInfo], [ExceptionMessage], [Exception], [ImpersonatorUserId], [ImpersonatorTenantId], [CustomData]) VALUES (365, 1, 4, N'School.LMS.StudentEducationalPayment.StudentPaymentAppService', N'GetStudentByName', N'{"studentName":"Mohamed Abdelmonem"}', NULL, CAST(N'2025-05-08T15:27:36.2279559' AS DateTime2), 13, N'::1', NULL, N'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/135.0.0.0 Safari/537.36', NULL, NULL, NULL, 1, NULL)
GO
INSERT [dbo].[AbpAuditLogs] ([Id], [TenantId], [UserId], [ServiceName], [MethodName], [Parameters], [ReturnValue], [ExecutionTime], [ExecutionDuration], [ClientIpAddress], [ClientName], [BrowserInfo], [ExceptionMessage], [Exception], [ImpersonatorUserId], [ImpersonatorTenantId], [CustomData]) VALUES (366, 1, 4, N'School.LMS.StudentEducationalPayment.StudentPaymentAppService', N'GetStudentPaymentDetailsAsync', N'{"studentId":"436"}', NULL, CAST(N'2025-05-08T15:27:36.2956234' AS DateTime2), 39, N'::1', NULL, N'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/135.0.0.0 Safari/537.36', NULL, NULL, NULL, 1, NULL)
GO
INSERT [dbo].[AbpAuditLogs] ([Id], [TenantId], [UserId], [ServiceName], [MethodName], [Parameters], [ReturnValue], [ExecutionTime], [ExecutionDuration], [ClientIpAddress], [ClientName], [BrowserInfo], [ExceptionMessage], [Exception], [ImpersonatorUserId], [ImpersonatorTenantId], [CustomData]) VALUES (367, 1, 4, N'School.LMS.Students.StudentImportService', N'GetAllAsync', N'{"input":{"keyword":null}}', NULL, CAST(N'2025-05-08T15:27:37.2789941' AS DateTime2), 29, N'::1', NULL, N'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/135.0.0.0 Safari/537.36', NULL, NULL, NULL, 1, NULL)
GO
INSERT [dbo].[AbpAuditLogs] ([Id], [TenantId], [UserId], [ServiceName], [MethodName], [Parameters], [ReturnValue], [ExecutionTime], [ExecutionDuration], [ClientIpAddress], [ClientName], [BrowserInfo], [ExceptionMessage], [Exception], [ImpersonatorUserId], [ImpersonatorTenantId], [CustomData]) VALUES (368, 1, 4, N'School.LMS.EducationalFeePlan.EducationFeeService', N'GetAllEducationalFees', N'{}', NULL, CAST(N'2025-05-08T15:27:37.2755193' AS DateTime2), 34, N'::1', NULL, N'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/135.0.0.0 Safari/537.36', NULL, NULL, NULL, 1, NULL)
GO
INSERT [dbo].[AbpAuditLogs] ([Id], [TenantId], [UserId], [ServiceName], [MethodName], [Parameters], [ReturnValue], [ExecutionTime], [ExecutionDuration], [ClientIpAddress], [ClientName], [BrowserInfo], [ExceptionMessage], [Exception], [ImpersonatorUserId], [ImpersonatorTenantId], [CustomData]) VALUES (369, 1, 4, N'School.LMS.EducationalFeePlan.EducationFeeService', N'GetAllEducationalFees', N'{}', NULL, CAST(N'2025-05-08T15:27:37.3008166' AS DateTime2), 41, N'::1', NULL, N'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/135.0.0.0 Safari/537.36', NULL, NULL, NULL, 1, NULL)
GO
INSERT [dbo].[AbpAuditLogs] ([Id], [TenantId], [UserId], [ServiceName], [MethodName], [Parameters], [ReturnValue], [ExecutionTime], [ExecutionDuration], [ClientIpAddress], [ClientName], [BrowserInfo], [ExceptionMessage], [Exception], [ImpersonatorUserId], [ImpersonatorTenantId], [CustomData]) VALUES (370, 1, 4, N'School.LMS.StudentEducationalPayment.StudentPaymentAppService', N'GetStudentByName', N'{"studentName":"Mohamed Abdelmonem"}', NULL, CAST(N'2025-05-08T15:27:41.0563412' AS DateTime2), 9, N'::1', NULL, N'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/135.0.0.0 Safari/537.36', NULL, NULL, NULL, 1, NULL)
GO
INSERT [dbo].[AbpAuditLogs] ([Id], [TenantId], [UserId], [ServiceName], [MethodName], [Parameters], [ReturnValue], [ExecutionTime], [ExecutionDuration], [ClientIpAddress], [ClientName], [BrowserInfo], [ExceptionMessage], [Exception], [ImpersonatorUserId], [ImpersonatorTenantId], [CustomData]) VALUES (371, 1, 4, N'School.LMS.StudentEducationalPayment.StudentPaymentAppService', N'GetStudentPaymentDetailsAsync', N'{"studentId":"436"}', NULL, CAST(N'2025-05-08T15:27:41.1036672' AS DateTime2), 32, N'::1', NULL, N'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/135.0.0.0 Safari/537.36', NULL, NULL, NULL, 1, NULL)
GO
INSERT [dbo].[AbpAuditLogs] ([Id], [TenantId], [UserId], [ServiceName], [MethodName], [Parameters], [ReturnValue], [ExecutionTime], [ExecutionDuration], [ClientIpAddress], [ClientName], [BrowserInfo], [ExceptionMessage], [Exception], [ImpersonatorUserId], [ImpersonatorTenantId], [CustomData]) VALUES (372, 1, 4, N'School.LMS.Students.StudentImportService', N'GetAllAsync', N'{"input":{"keyword":null}}', NULL, CAST(N'2025-05-08T15:27:42.6802347' AS DateTime2), 18, N'::1', NULL, N'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/135.0.0.0 Safari/537.36', NULL, NULL, NULL, 1, NULL)
GO
INSERT [dbo].[AbpAuditLogs] ([Id], [TenantId], [UserId], [ServiceName], [MethodName], [Parameters], [ReturnValue], [ExecutionTime], [ExecutionDuration], [ClientIpAddress], [ClientName], [BrowserInfo], [ExceptionMessage], [Exception], [ImpersonatorUserId], [ImpersonatorTenantId], [CustomData]) VALUES (373, 1, 4, N'School.LMS.EducationalFeePlan.EducationFeeService', N'GetAllEducationalFees', N'{}', NULL, CAST(N'2025-05-08T15:27:42.6711726' AS DateTime2), 28, N'::1', NULL, N'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/135.0.0.0 Safari/537.36', NULL, NULL, NULL, 1, NULL)
GO
INSERT [dbo].[AbpAuditLogs] ([Id], [TenantId], [UserId], [ServiceName], [MethodName], [Parameters], [ReturnValue], [ExecutionTime], [ExecutionDuration], [ClientIpAddress], [ClientName], [BrowserInfo], [ExceptionMessage], [Exception], [ImpersonatorUserId], [ImpersonatorTenantId], [CustomData]) VALUES (374, 1, 4, N'School.LMS.EducationalFeePlan.EducationFeeService', N'GetAllEducationalFees', N'{}', NULL, CAST(N'2025-05-08T15:27:42.6763042' AS DateTime2), 27, N'::1', NULL, N'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/135.0.0.0 Safari/537.36', NULL, NULL, NULL, 1, NULL)
GO
INSERT [dbo].[AbpAuditLogs] ([Id], [TenantId], [UserId], [ServiceName], [MethodName], [Parameters], [ReturnValue], [ExecutionTime], [ExecutionDuration], [ClientIpAddress], [ClientName], [BrowserInfo], [ExceptionMessage], [Exception], [ImpersonatorUserId], [ImpersonatorTenantId], [CustomData]) VALUES (375, 1, 4, N'School.LMS.StudentEducationalPayment.StudentPaymentAppService', N'GetStudentByName', N'{"studentName":"Mohamed Abdelmonem"}', NULL, CAST(N'2025-05-08T15:27:48.9310292' AS DateTime2), 11, N'::1', NULL, N'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/135.0.0.0 Safari/537.36', NULL, NULL, NULL, 1, NULL)
GO
INSERT [dbo].[AbpAuditLogs] ([Id], [TenantId], [UserId], [ServiceName], [MethodName], [Parameters], [ReturnValue], [ExecutionTime], [ExecutionDuration], [ClientIpAddress], [ClientName], [BrowserInfo], [ExceptionMessage], [Exception], [ImpersonatorUserId], [ImpersonatorTenantId], [CustomData]) VALUES (376, 1, 4, N'School.LMS.StudentEducationalPayment.StudentPaymentAppService', N'GetStudentPaymentDetailsAsync', N'{"studentId":"436"}', NULL, CAST(N'2025-05-08T15:27:48.9957550' AS DateTime2), 24, N'::1', NULL, N'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/135.0.0.0 Safari/537.36', NULL, NULL, NULL, 1, NULL)
GO
INSERT [dbo].[AbpAuditLogs] ([Id], [TenantId], [UserId], [ServiceName], [MethodName], [Parameters], [ReturnValue], [ExecutionTime], [ExecutionDuration], [ClientIpAddress], [ClientName], [BrowserInfo], [ExceptionMessage], [Exception], [ImpersonatorUserId], [ImpersonatorTenantId], [CustomData]) VALUES (377, 1, 4, N'Abp.AspNetCore.Mvc.Controllers.AbpUserConfigurationController', N'GetAll', N'{}', NULL, CAST(N'2025-05-08T15:29:35.3637062' AS DateTime2), 6, N'::1', NULL, N'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/135.0.0.0 Safari/537.36', NULL, NULL, NULL, 1, NULL)
GO
INSERT [dbo].[AbpAuditLogs] ([Id], [TenantId], [UserId], [ServiceName], [MethodName], [Parameters], [ReturnValue], [ExecutionTime], [ExecutionDuration], [ClientIpAddress], [ClientName], [BrowserInfo], [ExceptionMessage], [Exception], [ImpersonatorUserId], [ImpersonatorTenantId], [CustomData]) VALUES (378, 1, 4, N'School.LMS.StudentEducationalPayment.StudentPaymentAppService', N'GetStudentByName', N'{"studentName":"Mohamed Abdelmonem"}', NULL, CAST(N'2025-05-08T15:29:35.7314593' AS DateTime2), 8, N'::1', NULL, N'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/135.0.0.0 Safari/537.36', NULL, NULL, NULL, 1, NULL)
GO
INSERT [dbo].[AbpAuditLogs] ([Id], [TenantId], [UserId], [ServiceName], [MethodName], [Parameters], [ReturnValue], [ExecutionTime], [ExecutionDuration], [ClientIpAddress], [ClientName], [BrowserInfo], [ExceptionMessage], [Exception], [ImpersonatorUserId], [ImpersonatorTenantId], [CustomData]) VALUES (379, 1, 4, N'School.LMS.StudentEducationalPayment.StudentPaymentAppService', N'GetStudentPaymentDetailsAsync', N'{"studentId":"436"}', NULL, CAST(N'2025-05-08T15:29:35.8906363' AS DateTime2), 37, N'::1', NULL, N'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/135.0.0.0 Safari/537.36', NULL, NULL, NULL, 1, NULL)
GO
INSERT [dbo].[AbpAuditLogs] ([Id], [TenantId], [UserId], [ServiceName], [MethodName], [Parameters], [ReturnValue], [ExecutionTime], [ExecutionDuration], [ClientIpAddress], [ClientName], [BrowserInfo], [ExceptionMessage], [Exception], [ImpersonatorUserId], [ImpersonatorTenantId], [CustomData]) VALUES (380, 1, NULL, N'Abp.AspNetCore.Mvc.Controllers.AbpUserConfigurationController', N'GetAll', N'{}', NULL, CAST(N'2025-05-08T15:30:15.5827506' AS DateTime2), 4, N'::1', NULL, N'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/135.0.0.0 Safari/537.36', NULL, NULL, NULL, 1, NULL)
GO
INSERT [dbo].[AbpAuditLogs] ([Id], [TenantId], [UserId], [ServiceName], [MethodName], [Parameters], [ReturnValue], [ExecutionTime], [ExecutionDuration], [ClientIpAddress], [ClientName], [BrowserInfo], [ExceptionMessage], [Exception], [ImpersonatorUserId], [ImpersonatorTenantId], [CustomData]) VALUES (381, 1, NULL, N'School.LMS.Controllers.TokenAuthController', N'Authenticate', N'{"model":{"userNameOrEmailAddress":"admin","rememberClient":false}}', NULL, CAST(N'2025-05-08T15:30:20.0715042' AS DateTime2), 184, N'::1', NULL, N'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/135.0.0.0 Safari/537.36', NULL, NULL, NULL, 1, NULL)
GO
INSERT [dbo].[AbpAuditLogs] ([Id], [TenantId], [UserId], [ServiceName], [MethodName], [Parameters], [ReturnValue], [ExecutionTime], [ExecutionDuration], [ClientIpAddress], [ClientName], [BrowserInfo], [ExceptionMessage], [Exception], [ImpersonatorUserId], [ImpersonatorTenantId], [CustomData]) VALUES (382, 1, 2, N'Abp.AspNetCore.Mvc.Controllers.AbpUserConfigurationController', N'GetAll', N'{}', NULL, CAST(N'2025-05-08T15:30:20.6734318' AS DateTime2), 66, N'::1', NULL, N'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/135.0.0.0 Safari/537.36', NULL, NULL, NULL, 1, NULL)
GO
INSERT [dbo].[AbpAuditLogs] ([Id], [TenantId], [UserId], [ServiceName], [MethodName], [Parameters], [ReturnValue], [ExecutionTime], [ExecutionDuration], [ClientIpAddress], [ClientName], [BrowserInfo], [ExceptionMessage], [Exception], [ImpersonatorUserId], [ImpersonatorTenantId], [CustomData]) VALUES (383, 1, NULL, N'Abp.AspNetCore.Mvc.Controllers.AbpUserConfigurationController', N'GetAll', N'{}', NULL, CAST(N'2025-05-08T15:30:24.7668558' AS DateTime2), 3, N'::1', NULL, N'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/135.0.0.0 Safari/537.36', NULL, NULL, NULL, 1, NULL)
GO
INSERT [dbo].[AbpAuditLogs] ([Id], [TenantId], [UserId], [ServiceName], [MethodName], [Parameters], [ReturnValue], [ExecutionTime], [ExecutionDuration], [ClientIpAddress], [ClientName], [BrowserInfo], [ExceptionMessage], [Exception], [ImpersonatorUserId], [ImpersonatorTenantId], [CustomData]) VALUES (384, 1, NULL, N'Abp.AspNetCore.Mvc.Controllers.AbpUserConfigurationController', N'GetAll', N'{}', NULL, CAST(N'2025-05-08T15:34:11.6019453' AS DateTime2), 7, N'::1', NULL, N'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/135.0.0.0 Safari/537.36', NULL, NULL, NULL, 1, NULL)
GO
INSERT [dbo].[AbpAuditLogs] ([Id], [TenantId], [UserId], [ServiceName], [MethodName], [Parameters], [ReturnValue], [ExecutionTime], [ExecutionDuration], [ClientIpAddress], [ClientName], [BrowserInfo], [ExceptionMessage], [Exception], [ImpersonatorUserId], [ImpersonatorTenantId], [CustomData]) VALUES (385, 1, NULL, N'School.LMS.Controllers.TokenAuthController', N'Authenticate', N'{"model":{"userNameOrEmailAddress":"admin","rememberClient":false}}', NULL, CAST(N'2025-05-08T15:36:52.8399853' AS DateTime2), 255, N'::1', NULL, N'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/135.0.0.0 Safari/537.36', NULL, NULL, NULL, 1, NULL)
GO
INSERT [dbo].[AbpAuditLogs] ([Id], [TenantId], [UserId], [ServiceName], [MethodName], [Parameters], [ReturnValue], [ExecutionTime], [ExecutionDuration], [ClientIpAddress], [ClientName], [BrowserInfo], [ExceptionMessage], [Exception], [ImpersonatorUserId], [ImpersonatorTenantId], [CustomData]) VALUES (386, 1, 2, N'Abp.AspNetCore.Mvc.Controllers.AbpUserConfigurationController', N'GetAll', N'{}', NULL, CAST(N'2025-05-08T15:36:54.0124329' AS DateTime2), 7, N'::1', NULL, N'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/135.0.0.0 Safari/537.36', NULL, NULL, NULL, 1, NULL)
GO
INSERT [dbo].[AbpAuditLogs] ([Id], [TenantId], [UserId], [ServiceName], [MethodName], [Parameters], [ReturnValue], [ExecutionTime], [ExecutionDuration], [ClientIpAddress], [ClientName], [BrowserInfo], [ExceptionMessage], [Exception], [ImpersonatorUserId], [ImpersonatorTenantId], [CustomData]) VALUES (387, 1, 2, N'School.LMS.EducationalFeePlan.EducationFeeService', N'GetAllEducationalFees', N'{}', NULL, CAST(N'2025-05-08T15:37:40.3817738' AS DateTime2), 35, N'::1', NULL, N'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/135.0.0.0 Safari/537.36', NULL, NULL, NULL, 1, NULL)
GO
INSERT [dbo].[AbpAuditLogs] ([Id], [TenantId], [UserId], [ServiceName], [MethodName], [Parameters], [ReturnValue], [ExecutionTime], [ExecutionDuration], [ClientIpAddress], [ClientName], [BrowserInfo], [ExceptionMessage], [Exception], [ImpersonatorUserId], [ImpersonatorTenantId], [CustomData]) VALUES (388, 1, 2, N'School.LMS.EducationalFeePlan.EducationFeeService', N'GetAllEducationalFees', N'{}', NULL, CAST(N'2025-05-08T15:37:40.3992460' AS DateTime2), 18, N'::1', NULL, N'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/135.0.0.0 Safari/537.36', NULL, NULL, NULL, 1, NULL)
GO
INSERT [dbo].[AbpAuditLogs] ([Id], [TenantId], [UserId], [ServiceName], [MethodName], [Parameters], [ReturnValue], [ExecutionTime], [ExecutionDuration], [ClientIpAddress], [ClientName], [BrowserInfo], [ExceptionMessage], [Exception], [ImpersonatorUserId], [ImpersonatorTenantId], [CustomData]) VALUES (389, 1, 2, N'School.LMS.Students.StudentImportService', N'GetAllAsync', N'{"input":{"keyword":null}}', NULL, CAST(N'2025-05-08T15:37:40.3992983' AS DateTime2), 74, N'::1', NULL, N'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/135.0.0.0 Safari/537.36', NULL, NULL, NULL, 1, NULL)
GO
INSERT [dbo].[AbpAuditLogs] ([Id], [TenantId], [UserId], [ServiceName], [MethodName], [Parameters], [ReturnValue], [ExecutionTime], [ExecutionDuration], [ClientIpAddress], [ClientName], [BrowserInfo], [ExceptionMessage], [Exception], [ImpersonatorUserId], [ImpersonatorTenantId], [CustomData]) VALUES (390, 1, 2, N'School.LMS.Roles.RoleAppService', N'GetAllAsync', N'{"input":{"keyword":null,"skipCount":0,"maxResultCount":10}}', NULL, CAST(N'2025-05-08T15:41:40.8528534' AS DateTime2), 117, N'::1', NULL, N'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/135.0.0.0 Safari/537.36', NULL, NULL, NULL, 1, NULL)
GO
INSERT [dbo].[AbpAuditLogs] ([Id], [TenantId], [UserId], [ServiceName], [MethodName], [Parameters], [ReturnValue], [ExecutionTime], [ExecutionDuration], [ClientIpAddress], [ClientName], [BrowserInfo], [ExceptionMessage], [Exception], [ImpersonatorUserId], [ImpersonatorTenantId], [CustomData]) VALUES (391, 1, 2, N'School.LMS.Students.StudentImportService', N'GetAllAsync', N'{"input":{"keyword":null}}', NULL, CAST(N'2025-05-08T15:41:51.9764248' AS DateTime2), 28, N'::1', NULL, N'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/135.0.0.0 Safari/537.36', NULL, NULL, NULL, 1, NULL)
GO
INSERT [dbo].[AbpAuditLogs] ([Id], [TenantId], [UserId], [ServiceName], [MethodName], [Parameters], [ReturnValue], [ExecutionTime], [ExecutionDuration], [ClientIpAddress], [ClientName], [BrowserInfo], [ExceptionMessage], [Exception], [ImpersonatorUserId], [ImpersonatorTenantId], [CustomData]) VALUES (392, 1, 2, N'School.LMS.EducationalFeePlan.EducationFeeService', N'GetAllEducationalFees', N'{}', NULL, CAST(N'2025-05-08T15:41:51.9879481' AS DateTime2), 20, N'::1', NULL, N'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/135.0.0.0 Safari/537.36', NULL, NULL, NULL, 1, NULL)
GO
INSERT [dbo].[AbpAuditLogs] ([Id], [TenantId], [UserId], [ServiceName], [MethodName], [Parameters], [ReturnValue], [ExecutionTime], [ExecutionDuration], [ClientIpAddress], [ClientName], [BrowserInfo], [ExceptionMessage], [Exception], [ImpersonatorUserId], [ImpersonatorTenantId], [CustomData]) VALUES (393, 1, 2, N'School.LMS.EducationalFeePlan.EducationFeeService', N'GetAllEducationalFees', N'{}', NULL, CAST(N'2025-05-08T15:41:51.9801808' AS DateTime2), 27, N'::1', NULL, N'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/135.0.0.0 Safari/537.36', NULL, NULL, NULL, 1, NULL)
GO
INSERT [dbo].[AbpAuditLogs] ([Id], [TenantId], [UserId], [ServiceName], [MethodName], [Parameters], [ReturnValue], [ExecutionTime], [ExecutionDuration], [ClientIpAddress], [ClientName], [BrowserInfo], [ExceptionMessage], [Exception], [ImpersonatorUserId], [ImpersonatorTenantId], [CustomData]) VALUES (394, 1, 2, N'School.LMS.Users.UserAppService', N'GetAllAsync', N'{"input":{"keyword":null,"isActive":null,"skipCount":0,"maxResultCount":10}}', NULL, CAST(N'2025-05-08T15:42:32.3735234' AS DateTime2), 311, N'::1', NULL, N'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/135.0.0.0 Safari/537.36', NULL, NULL, NULL, 1, NULL)
GO
INSERT [dbo].[AbpAuditLogs] ([Id], [TenantId], [UserId], [ServiceName], [MethodName], [Parameters], [ReturnValue], [ExecutionTime], [ExecutionDuration], [ClientIpAddress], [ClientName], [BrowserInfo], [ExceptionMessage], [Exception], [ImpersonatorUserId], [ImpersonatorTenantId], [CustomData]) VALUES (395, 1, 2, N'School.LMS.Users.UserAppService', N'GetAsync', N'{"input":{"id":4}}', NULL, CAST(N'2025-05-08T15:42:46.5903724' AS DateTime2), 53, N'::1', NULL, N'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/135.0.0.0 Safari/537.36', NULL, NULL, NULL, 1, NULL)
GO
INSERT [dbo].[AbpAuditLogs] ([Id], [TenantId], [UserId], [ServiceName], [MethodName], [Parameters], [ReturnValue], [ExecutionTime], [ExecutionDuration], [ClientIpAddress], [ClientName], [BrowserInfo], [ExceptionMessage], [Exception], [ImpersonatorUserId], [ImpersonatorTenantId], [CustomData]) VALUES (396, 1, 2, N'School.LMS.Users.UserAppService', N'GetRoles', N'{}', NULL, CAST(N'2025-05-08T15:42:46.7013932' AS DateTime2), 44, N'::1', NULL, N'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/135.0.0.0 Safari/537.36', NULL, NULL, NULL, 1, NULL)
GO
INSERT [dbo].[AbpAuditLogs] ([Id], [TenantId], [UserId], [ServiceName], [MethodName], [Parameters], [ReturnValue], [ExecutionTime], [ExecutionDuration], [ClientIpAddress], [ClientName], [BrowserInfo], [ExceptionMessage], [Exception], [ImpersonatorUserId], [ImpersonatorTenantId], [CustomData]) VALUES (397, 1, 2, N'School.LMS.Users.UserAppService', N'GetAsync', N'{"input":{"id":2}}', NULL, CAST(N'2025-05-08T15:42:52.6994793' AS DateTime2), 31, N'::1', NULL, N'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/135.0.0.0 Safari/537.36', NULL, NULL, NULL, 1, NULL)
GO
INSERT [dbo].[AbpAuditLogs] ([Id], [TenantId], [UserId], [ServiceName], [MethodName], [Parameters], [ReturnValue], [ExecutionTime], [ExecutionDuration], [ClientIpAddress], [ClientName], [BrowserInfo], [ExceptionMessage], [Exception], [ImpersonatorUserId], [ImpersonatorTenantId], [CustomData]) VALUES (398, 1, 2, N'School.LMS.Users.UserAppService', N'GetRoles', N'{}', NULL, CAST(N'2025-05-08T15:42:52.7918094' AS DateTime2), 17, N'::1', NULL, N'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/135.0.0.0 Safari/537.36', NULL, NULL, NULL, 1, NULL)
GO
INSERT [dbo].[AbpAuditLogs] ([Id], [TenantId], [UserId], [ServiceName], [MethodName], [Parameters], [ReturnValue], [ExecutionTime], [ExecutionDuration], [ClientIpAddress], [ClientName], [BrowserInfo], [ExceptionMessage], [Exception], [ImpersonatorUserId], [ImpersonatorTenantId], [CustomData]) VALUES (399, 1, NULL, N'Abp.AspNetCore.Mvc.Controllers.AbpUserConfigurationController', N'GetAll', N'{}', NULL, CAST(N'2025-05-08T15:43:19.1069599' AS DateTime2), 11, N'::1', NULL, N'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/135.0.0.0 Safari/537.36', NULL, NULL, NULL, 1, NULL)
GO
INSERT [dbo].[AbpAuditLogs] ([Id], [TenantId], [UserId], [ServiceName], [MethodName], [Parameters], [ReturnValue], [ExecutionTime], [ExecutionDuration], [ClientIpAddress], [ClientName], [BrowserInfo], [ExceptionMessage], [Exception], [ImpersonatorUserId], [ImpersonatorTenantId], [CustomData]) VALUES (400, 1, NULL, N'School.LMS.Controllers.TokenAuthController', N'Authenticate', N'{"model":{"userNameOrEmailAddress":"01545646456","rememberClient":false}}', NULL, CAST(N'2025-05-08T15:43:37.2289912' AS DateTime2), 244, N'::1', NULL, N'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/135.0.0.0 Safari/537.36', NULL, NULL, NULL, 1, NULL)
GO
INSERT [dbo].[AbpAuditLogs] ([Id], [TenantId], [UserId], [ServiceName], [MethodName], [Parameters], [ReturnValue], [ExecutionTime], [ExecutionDuration], [ClientIpAddress], [ClientName], [BrowserInfo], [ExceptionMessage], [Exception], [ImpersonatorUserId], [ImpersonatorTenantId], [CustomData]) VALUES (401, 1, 3, N'Abp.AspNetCore.Mvc.Controllers.AbpUserConfigurationController', N'GetAll', N'{}', NULL, CAST(N'2025-05-08T15:43:38.9035657' AS DateTime2), 11, N'::1', NULL, N'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/135.0.0.0 Safari/537.36', NULL, NULL, NULL, 1, NULL)
GO
INSERT [dbo].[AbpAuditLogs] ([Id], [TenantId], [UserId], [ServiceName], [MethodName], [Parameters], [ReturnValue], [ExecutionTime], [ExecutionDuration], [ClientIpAddress], [ClientName], [BrowserInfo], [ExceptionMessage], [Exception], [ImpersonatorUserId], [ImpersonatorTenantId], [CustomData]) VALUES (402, 1, 3, N'School.LMS.StudentEducationalPayment.StudentPaymentAppService', N'GetStudentByName', N'{"studentName":"Ahmed Ali"}', NULL, CAST(N'2025-05-08T15:43:50.6886530' AS DateTime2), 9, N'::1', NULL, N'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/135.0.0.0 Safari/537.36', NULL, NULL, NULL, 1, NULL)
GO
INSERT [dbo].[AbpAuditLogs] ([Id], [TenantId], [UserId], [ServiceName], [MethodName], [Parameters], [ReturnValue], [ExecutionTime], [ExecutionDuration], [ClientIpAddress], [ClientName], [BrowserInfo], [ExceptionMessage], [Exception], [ImpersonatorUserId], [ImpersonatorTenantId], [CustomData]) VALUES (403, 1, 3, N'School.LMS.StudentEducationalPayment.StudentPaymentAppService', N'GetStudentPaymentDetailsAsync', N'{"studentId":"125"}', NULL, CAST(N'2025-05-08T15:43:50.7495023' AS DateTime2), 36, N'::1', NULL, N'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/135.0.0.0 Safari/537.36', NULL, NULL, NULL, 1, NULL)
GO
INSERT [dbo].[AbpAuditLogs] ([Id], [TenantId], [UserId], [ServiceName], [MethodName], [Parameters], [ReturnValue], [ExecutionTime], [ExecutionDuration], [ClientIpAddress], [ClientName], [BrowserInfo], [ExceptionMessage], [Exception], [ImpersonatorUserId], [ImpersonatorTenantId], [CustomData]) VALUES (404, 1, NULL, N'Abp.AspNetCore.Mvc.Controllers.AbpUserConfigurationController', N'GetAll', N'{}', NULL, CAST(N'2025-05-08T15:44:15.5899272' AS DateTime2), 3, N'::1', NULL, N'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/135.0.0.0 Safari/537.36', NULL, NULL, NULL, 1, NULL)
GO
INSERT [dbo].[AbpAuditLogs] ([Id], [TenantId], [UserId], [ServiceName], [MethodName], [Parameters], [ReturnValue], [ExecutionTime], [ExecutionDuration], [ClientIpAddress], [ClientName], [BrowserInfo], [ExceptionMessage], [Exception], [ImpersonatorUserId], [ImpersonatorTenantId], [CustomData]) VALUES (405, 1, NULL, N'School.LMS.Controllers.TokenAuthController', N'Authenticate', N'{"model":{"userNameOrEmailAddress":"01014267914","rememberClient":false}}', NULL, CAST(N'2025-05-08T15:44:20.1206921' AS DateTime2), 185, N'::1', NULL, N'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/135.0.0.0 Safari/537.36', NULL, NULL, NULL, 1, NULL)
GO
INSERT [dbo].[AbpAuditLogs] ([Id], [TenantId], [UserId], [ServiceName], [MethodName], [Parameters], [ReturnValue], [ExecutionTime], [ExecutionDuration], [ClientIpAddress], [ClientName], [BrowserInfo], [ExceptionMessage], [Exception], [ImpersonatorUserId], [ImpersonatorTenantId], [CustomData]) VALUES (406, 1, 4, N'Abp.AspNetCore.Mvc.Controllers.AbpUserConfigurationController', N'GetAll', N'{}', NULL, CAST(N'2025-05-08T15:44:20.7922496' AS DateTime2), 6, N'::1', NULL, N'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/135.0.0.0 Safari/537.36', NULL, NULL, NULL, 1, NULL)
GO
INSERT [dbo].[AbpAuditLogs] ([Id], [TenantId], [UserId], [ServiceName], [MethodName], [Parameters], [ReturnValue], [ExecutionTime], [ExecutionDuration], [ClientIpAddress], [ClientName], [BrowserInfo], [ExceptionMessage], [Exception], [ImpersonatorUserId], [ImpersonatorTenantId], [CustomData]) VALUES (407, 1, 4, N'School.LMS.StudentEducationalPayment.StudentPaymentAppService', N'GetStudentByName', N'{"studentName":"Mohamed Abdelmonem"}', NULL, CAST(N'2025-05-08T15:44:22.8134493' AS DateTime2), 7, N'::1', NULL, N'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/135.0.0.0 Safari/537.36', NULL, NULL, NULL, 1, NULL)
GO
INSERT [dbo].[AbpAuditLogs] ([Id], [TenantId], [UserId], [ServiceName], [MethodName], [Parameters], [ReturnValue], [ExecutionTime], [ExecutionDuration], [ClientIpAddress], [ClientName], [BrowserInfo], [ExceptionMessage], [Exception], [ImpersonatorUserId], [ImpersonatorTenantId], [CustomData]) VALUES (408, 1, 4, N'School.LMS.StudentEducationalPayment.StudentPaymentAppService', N'GetStudentPaymentDetailsAsync', N'{"studentId":"436"}', NULL, CAST(N'2025-05-08T15:44:22.8678321' AS DateTime2), 33, N'::1', NULL, N'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/135.0.0.0 Safari/537.36', NULL, NULL, NULL, 1, NULL)
GO
INSERT [dbo].[AbpAuditLogs] ([Id], [TenantId], [UserId], [ServiceName], [MethodName], [Parameters], [ReturnValue], [ExecutionTime], [ExecutionDuration], [ClientIpAddress], [ClientName], [BrowserInfo], [ExceptionMessage], [Exception], [ImpersonatorUserId], [ImpersonatorTenantId], [CustomData]) VALUES (409, 1, NULL, N'Abp.AspNetCore.Mvc.Controllers.AbpUserConfigurationController', N'GetAll', N'{}', NULL, CAST(N'2025-05-08T15:46:03.1254631' AS DateTime2), 7, N'::1', NULL, N'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/135.0.0.0 Safari/537.36', NULL, NULL, NULL, 1, NULL)
GO
INSERT [dbo].[AbpAuditLogs] ([Id], [TenantId], [UserId], [ServiceName], [MethodName], [Parameters], [ReturnValue], [ExecutionTime], [ExecutionDuration], [ClientIpAddress], [ClientName], [BrowserInfo], [ExceptionMessage], [Exception], [ImpersonatorUserId], [ImpersonatorTenantId], [CustomData]) VALUES (410, 1, NULL, N'School.LMS.Controllers.TokenAuthController', N'Authenticate', N'{"model":{"userNameOrEmailAddress":"01234267685","rememberClient":false}}', NULL, CAST(N'2025-05-08T15:46:16.9018050' AS DateTime2), 257, N'::1', NULL, N'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/135.0.0.0 Safari/537.36', NULL, NULL, NULL, 1, NULL)
GO
INSERT [dbo].[AbpAuditLogs] ([Id], [TenantId], [UserId], [ServiceName], [MethodName], [Parameters], [ReturnValue], [ExecutionTime], [ExecutionDuration], [ClientIpAddress], [ClientName], [BrowserInfo], [ExceptionMessage], [Exception], [ImpersonatorUserId], [ImpersonatorTenantId], [CustomData]) VALUES (411, 1, 5, N'Abp.AspNetCore.Mvc.Controllers.AbpUserConfigurationController', N'GetAll', N'{}', NULL, CAST(N'2025-05-08T15:46:17.7604354' AS DateTime2), 59, N'::1', NULL, N'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/135.0.0.0 Safari/537.36', NULL, NULL, NULL, 1, NULL)
GO
INSERT [dbo].[AbpAuditLogs] ([Id], [TenantId], [UserId], [ServiceName], [MethodName], [Parameters], [ReturnValue], [ExecutionTime], [ExecutionDuration], [ClientIpAddress], [ClientName], [BrowserInfo], [ExceptionMessage], [Exception], [ImpersonatorUserId], [ImpersonatorTenantId], [CustomData]) VALUES (412, 1, 5, N'School.LMS.StudentEducationalPayment.StudentPaymentAppService', N'GetStudentByName', N'{"studentName":"Ehab Osama"}', NULL, CAST(N'2025-05-08T15:46:20.4835512' AS DateTime2), 13, N'::1', NULL, N'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/135.0.0.0 Safari/537.36', NULL, NULL, NULL, 1, NULL)
GO
INSERT [dbo].[AbpAuditLogs] ([Id], [TenantId], [UserId], [ServiceName], [MethodName], [Parameters], [ReturnValue], [ExecutionTime], [ExecutionDuration], [ClientIpAddress], [ClientName], [BrowserInfo], [ExceptionMessage], [Exception], [ImpersonatorUserId], [ImpersonatorTenantId], [CustomData]) VALUES (413, 1, 5, N'School.LMS.StudentEducationalPayment.StudentPaymentAppService', N'GetStudentPaymentDetailsAsync', N'{"studentId":"1127"}', NULL, CAST(N'2025-05-08T15:46:20.5490315' AS DateTime2), 39, N'::1', NULL, N'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/135.0.0.0 Safari/537.36', NULL, NULL, NULL, 1, NULL)
GO
INSERT [dbo].[AbpAuditLogs] ([Id], [TenantId], [UserId], [ServiceName], [MethodName], [Parameters], [ReturnValue], [ExecutionTime], [ExecutionDuration], [ClientIpAddress], [ClientName], [BrowserInfo], [ExceptionMessage], [Exception], [ImpersonatorUserId], [ImpersonatorTenantId], [CustomData]) VALUES (414, 1, 5, N'School.LMS.StudentEducationalPayment.StudentPaymentAppService', N'SubmitEducationalPaymentAsync', N'{"input":{"studentId":1127,"isFullPayment":false,"amountPaid":9000.0,"paymentDate":"2025-05-08T15:47:40.592+03:00","selectedInstallmentIds":[21],"id":0}}', NULL, CAST(N'2025-05-08T15:47:40.6393723' AS DateTime2), 77, N'::1', NULL, N'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/135.0.0.0 Safari/537.36', NULL, NULL, NULL, 1, NULL)
GO
INSERT [dbo].[AbpAuditLogs] ([Id], [TenantId], [UserId], [ServiceName], [MethodName], [Parameters], [ReturnValue], [ExecutionTime], [ExecutionDuration], [ClientIpAddress], [ClientName], [BrowserInfo], [ExceptionMessage], [Exception], [ImpersonatorUserId], [ImpersonatorTenantId], [CustomData]) VALUES (415, 1, 5, N'Abp.AspNetCore.Mvc.Controllers.AbpUserConfigurationController', N'GetAll', N'{}', NULL, CAST(N'2025-05-08T15:47:45.9223967' AS DateTime2), 6, N'::1', NULL, N'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/135.0.0.0 Safari/537.36', NULL, NULL, NULL, 1, NULL)
GO
INSERT [dbo].[AbpAuditLogs] ([Id], [TenantId], [UserId], [ServiceName], [MethodName], [Parameters], [ReturnValue], [ExecutionTime], [ExecutionDuration], [ClientIpAddress], [ClientName], [BrowserInfo], [ExceptionMessage], [Exception], [ImpersonatorUserId], [ImpersonatorTenantId], [CustomData]) VALUES (416, 1, 5, N'School.LMS.StudentEducationalPayment.StudentPaymentAppService', N'GetStudentByName', N'{"studentName":"Ehab Osama"}', NULL, CAST(N'2025-05-08T15:47:46.1542119' AS DateTime2), 36, N'::1', NULL, N'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/135.0.0.0 Safari/537.36', NULL, NULL, NULL, 1, NULL)
GO
INSERT [dbo].[AbpAuditLogs] ([Id], [TenantId], [UserId], [ServiceName], [MethodName], [Parameters], [ReturnValue], [ExecutionTime], [ExecutionDuration], [ClientIpAddress], [ClientName], [BrowserInfo], [ExceptionMessage], [Exception], [ImpersonatorUserId], [ImpersonatorTenantId], [CustomData]) VALUES (417, 1, 5, N'School.LMS.StudentEducationalPayment.StudentPaymentAppService', N'GetStudentPaymentDetailsAsync', N'{"studentId":"1127"}', NULL, CAST(N'2025-05-08T15:47:46.2843747' AS DateTime2), 37, N'::1', NULL, N'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/135.0.0.0 Safari/537.36', NULL, NULL, NULL, 1, NULL)
GO
INSERT [dbo].[AbpAuditLogs] ([Id], [TenantId], [UserId], [ServiceName], [MethodName], [Parameters], [ReturnValue], [ExecutionTime], [ExecutionDuration], [ClientIpAddress], [ClientName], [BrowserInfo], [ExceptionMessage], [Exception], [ImpersonatorUserId], [ImpersonatorTenantId], [CustomData]) VALUES (418, 1, 5, N'School.LMS.StudentEducationalPayment.StudentPaymentAppService', N'SubscribeToBusAsync', N'{"input":{"studentId":1127,"busLineId":3,"note":null,"id":0}}', NULL, CAST(N'2025-05-08T15:48:27.2587613' AS DateTime2), 2215, N'::1', NULL, N'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/135.0.0.0 Safari/537.36', NULL, NULL, NULL, 1, NULL)
GO
INSERT [dbo].[AbpAuditLogs] ([Id], [TenantId], [UserId], [ServiceName], [MethodName], [Parameters], [ReturnValue], [ExecutionTime], [ExecutionDuration], [ClientIpAddress], [ClientName], [BrowserInfo], [ExceptionMessage], [Exception], [ImpersonatorUserId], [ImpersonatorTenantId], [CustomData]) VALUES (419, 1, 5, N'Abp.AspNetCore.Mvc.Controllers.AbpUserConfigurationController', N'GetAll', N'{}', NULL, CAST(N'2025-05-08T15:48:32.7560040' AS DateTime2), 7, N'::1', NULL, N'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/135.0.0.0 Safari/537.36', NULL, NULL, NULL, 1, NULL)
GO
INSERT [dbo].[AbpAuditLogs] ([Id], [TenantId], [UserId], [ServiceName], [MethodName], [Parameters], [ReturnValue], [ExecutionTime], [ExecutionDuration], [ClientIpAddress], [ClientName], [BrowserInfo], [ExceptionMessage], [Exception], [ImpersonatorUserId], [ImpersonatorTenantId], [CustomData]) VALUES (420, 1, 5, N'School.LMS.StudentEducationalPayment.StudentPaymentAppService', N'GetStudentByName', N'{"studentName":"Ehab Osama"}', NULL, CAST(N'2025-05-08T15:48:33.0204900' AS DateTime2), 14, N'::1', NULL, N'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/135.0.0.0 Safari/537.36', NULL, NULL, NULL, 1, NULL)
GO
INSERT [dbo].[AbpAuditLogs] ([Id], [TenantId], [UserId], [ServiceName], [MethodName], [Parameters], [ReturnValue], [ExecutionTime], [ExecutionDuration], [ClientIpAddress], [ClientName], [BrowserInfo], [ExceptionMessage], [Exception], [ImpersonatorUserId], [ImpersonatorTenantId], [CustomData]) VALUES (421, 1, 5, N'School.LMS.StudentEducationalPayment.StudentPaymentAppService', N'GetStudentPaymentDetailsAsync', N'{"studentId":"1127"}', NULL, CAST(N'2025-05-08T15:48:33.2207812' AS DateTime2), 38, N'::1', NULL, N'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/135.0.0.0 Safari/537.36', NULL, NULL, NULL, 1, NULL)
GO
INSERT [dbo].[AbpAuditLogs] ([Id], [TenantId], [UserId], [ServiceName], [MethodName], [Parameters], [ReturnValue], [ExecutionTime], [ExecutionDuration], [ClientIpAddress], [ClientName], [BrowserInfo], [ExceptionMessage], [Exception], [ImpersonatorUserId], [ImpersonatorTenantId], [CustomData]) VALUES (422, 1, 5, N'School.LMS.Roles.RoleAppService', N'GetAllAsync', N'{"input":{"keyword":null,"skipCount":0,"maxResultCount":10}}', NULL, CAST(N'2025-05-08T16:01:10.9477238' AS DateTime2), 53, N'::1', NULL, N'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/135.0.0.0 Safari/537.36', NULL, NULL, NULL, 1, NULL)
GO
INSERT [dbo].[AbpAuditLogs] ([Id], [TenantId], [UserId], [ServiceName], [MethodName], [Parameters], [ReturnValue], [ExecutionTime], [ExecutionDuration], [ClientIpAddress], [ClientName], [BrowserInfo], [ExceptionMessage], [Exception], [ImpersonatorUserId], [ImpersonatorTenantId], [CustomData]) VALUES (423, 1, 5, N'School.LMS.Roles.RoleAppService', N'GetAllAsync', N'{"input":{"keyword":"studen","skipCount":0,"maxResultCount":10}}', NULL, CAST(N'2025-05-08T16:01:41.7503677' AS DateTime2), 41, N'::1', NULL, N'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/135.0.0.0 Safari/537.36', NULL, NULL, NULL, 1, NULL)
GO
INSERT [dbo].[AbpAuditLogs] ([Id], [TenantId], [UserId], [ServiceName], [MethodName], [Parameters], [ReturnValue], [ExecutionTime], [ExecutionDuration], [ClientIpAddress], [ClientName], [BrowserInfo], [ExceptionMessage], [Exception], [ImpersonatorUserId], [ImpersonatorTenantId], [CustomData]) VALUES (424, 1, 5, N'School.LMS.Roles.RoleAppService', N'GetAllAsync', N'{"input":{"keyword":null,"skipCount":0,"maxResultCount":10}}', NULL, CAST(N'2025-05-08T16:01:45.6225128' AS DateTime2), 49, N'::1', NULL, N'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/135.0.0.0 Safari/537.36', NULL, NULL, NULL, 1, NULL)
GO
INSERT [dbo].[AbpAuditLogs] ([Id], [TenantId], [UserId], [ServiceName], [MethodName], [Parameters], [ReturnValue], [ExecutionTime], [ExecutionDuration], [ClientIpAddress], [ClientName], [BrowserInfo], [ExceptionMessage], [Exception], [ImpersonatorUserId], [ImpersonatorTenantId], [CustomData]) VALUES (425, 1, 5, N'School.LMS.EducationalFeePlan.EducationFeeService', N'GetAllEducationalFees', N'{}', NULL, CAST(N'2025-05-08T16:09:31.0480515' AS DateTime2), 29, N'::1', NULL, N'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/135.0.0.0 Safari/537.36', NULL, NULL, NULL, 1, NULL)
GO
INSERT [dbo].[AbpAuditLogs] ([Id], [TenantId], [UserId], [ServiceName], [MethodName], [Parameters], [ReturnValue], [ExecutionTime], [ExecutionDuration], [ClientIpAddress], [ClientName], [BrowserInfo], [ExceptionMessage], [Exception], [ImpersonatorUserId], [ImpersonatorTenantId], [CustomData]) VALUES (426, 1, 5, N'School.LMS.Students.StudentImportService', N'GetAllAsync', N'{"input":{"keyword":null}}', NULL, CAST(N'2025-05-08T16:09:31.0548676' AS DateTime2), 28, N'::1', NULL, N'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/135.0.0.0 Safari/537.36', NULL, NULL, NULL, 1, NULL)
GO
INSERT [dbo].[AbpAuditLogs] ([Id], [TenantId], [UserId], [ServiceName], [MethodName], [Parameters], [ReturnValue], [ExecutionTime], [ExecutionDuration], [ClientIpAddress], [ClientName], [BrowserInfo], [ExceptionMessage], [Exception], [ImpersonatorUserId], [ImpersonatorTenantId], [CustomData]) VALUES (427, 1, 5, N'School.LMS.EducationalFeePlan.EducationFeeService', N'GetAllEducationalFees', N'{}', NULL, CAST(N'2025-05-08T16:09:31.0549453' AS DateTime2), 32, N'::1', NULL, N'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/135.0.0.0 Safari/537.36', NULL, NULL, NULL, 1, NULL)
GO
INSERT [dbo].[AbpAuditLogs] ([Id], [TenantId], [UserId], [ServiceName], [MethodName], [Parameters], [ReturnValue], [ExecutionTime], [ExecutionDuration], [ClientIpAddress], [ClientName], [BrowserInfo], [ExceptionMessage], [Exception], [ImpersonatorUserId], [ImpersonatorTenantId], [CustomData]) VALUES (428, 1, 5, N'School.LMS.StudentEducationalPayment.StudentPaymentAppService', N'GetStudentByName', N'{"studentName":"Ehab Osama"}', NULL, CAST(N'2025-05-08T16:09:33.5896390' AS DateTime2), 12, N'::1', NULL, N'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/135.0.0.0 Safari/537.36', NULL, NULL, NULL, 1, NULL)
GO
INSERT [dbo].[AbpAuditLogs] ([Id], [TenantId], [UserId], [ServiceName], [MethodName], [Parameters], [ReturnValue], [ExecutionTime], [ExecutionDuration], [ClientIpAddress], [ClientName], [BrowserInfo], [ExceptionMessage], [Exception], [ImpersonatorUserId], [ImpersonatorTenantId], [CustomData]) VALUES (429, 1, 5, N'School.LMS.StudentEducationalPayment.StudentPaymentAppService', N'GetStudentPaymentDetailsAsync', N'{"studentId":"1127"}', NULL, CAST(N'2025-05-08T16:09:33.6509190' AS DateTime2), 36, N'::1', NULL, N'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/135.0.0.0 Safari/537.36', NULL, NULL, NULL, 1, NULL)
GO
INSERT [dbo].[AbpAuditLogs] ([Id], [TenantId], [UserId], [ServiceName], [MethodName], [Parameters], [ReturnValue], [ExecutionTime], [ExecutionDuration], [ClientIpAddress], [ClientName], [BrowserInfo], [ExceptionMessage], [Exception], [ImpersonatorUserId], [ImpersonatorTenantId], [CustomData]) VALUES (430, 1, NULL, N'School.LMS.Web.Host.Controllers.HomeController', N'Index', N'{}', NULL, CAST(N'2025-05-09T14:47:40.2254035' AS DateTime2), 11, N'::1', NULL, N'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/135.0.0.0 Safari/537.36', NULL, NULL, NULL, 1, NULL)
GO
INSERT [dbo].[AbpAuditLogs] ([Id], [TenantId], [UserId], [ServiceName], [MethodName], [Parameters], [ReturnValue], [ExecutionTime], [ExecutionDuration], [ClientIpAddress], [ClientName], [BrowserInfo], [ExceptionMessage], [Exception], [ImpersonatorUserId], [ImpersonatorTenantId], [CustomData]) VALUES (431, 1, 5, N'School.LMS.Web.Host.Controllers.AntiForgeryController', N'SetCookie', N'{}', NULL, CAST(N'2025-05-09T14:47:44.4268518' AS DateTime2), 35, N'::1', NULL, N'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/135.0.0.0 Safari/537.36', NULL, NULL, NULL, 1, NULL)
GO
INSERT [dbo].[AbpAuditLogs] ([Id], [TenantId], [UserId], [ServiceName], [MethodName], [Parameters], [ReturnValue], [ExecutionTime], [ExecutionDuration], [ClientIpAddress], [ClientName], [BrowserInfo], [ExceptionMessage], [Exception], [ImpersonatorUserId], [ImpersonatorTenantId], [CustomData]) VALUES (432, 1, 5, N'Abp.AspNetCore.Mvc.Controllers.AbpUserConfigurationController', N'GetAll', N'{}', NULL, CAST(N'2025-05-09T14:49:28.8464752' AS DateTime2), 26854, N'::1', NULL, N'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/135.0.0.0 Safari/537.36', NULL, NULL, NULL, 1, NULL)
GO
INSERT [dbo].[AbpAuditLogs] ([Id], [TenantId], [UserId], [ServiceName], [MethodName], [Parameters], [ReturnValue], [ExecutionTime], [ExecutionDuration], [ClientIpAddress], [ClientName], [BrowserInfo], [ExceptionMessage], [Exception], [ImpersonatorUserId], [ImpersonatorTenantId], [CustomData]) VALUES (433, 1, NULL, N'Abp.AspNetCore.Mvc.Controllers.AbpUserConfigurationController', N'GetAll', N'{}', NULL, CAST(N'2025-05-09T14:50:01.5832698' AS DateTime2), 14, N'::1', NULL, N'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/135.0.0.0 Safari/537.36', NULL, NULL, NULL, 1, NULL)
GO
INSERT [dbo].[AbpAuditLogs] ([Id], [TenantId], [UserId], [ServiceName], [MethodName], [Parameters], [ReturnValue], [ExecutionTime], [ExecutionDuration], [ClientIpAddress], [ClientName], [BrowserInfo], [ExceptionMessage], [Exception], [ImpersonatorUserId], [ImpersonatorTenantId], [CustomData]) VALUES (434, 1, NULL, N'School.LMS.Controllers.TokenAuthController', N'Authenticate', N'{"model":{"userNameOrEmailAddress":"admin","rememberClient":false}}', NULL, CAST(N'2025-05-09T15:02:57.0726973' AS DateTime2), 1301, N'::1', NULL, N'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/135.0.0.0 Safari/537.36', NULL, NULL, NULL, 1, NULL)
GO
INSERT [dbo].[AbpAuditLogs] ([Id], [TenantId], [UserId], [ServiceName], [MethodName], [Parameters], [ReturnValue], [ExecutionTime], [ExecutionDuration], [ClientIpAddress], [ClientName], [BrowserInfo], [ExceptionMessage], [Exception], [ImpersonatorUserId], [ImpersonatorTenantId], [CustomData]) VALUES (435, 1, 2, N'Abp.AspNetCore.Mvc.Controllers.AbpUserConfigurationController', N'GetAll', N'{}', NULL, CAST(N'2025-05-09T15:03:00.1270441' AS DateTime2), 296, N'::1', NULL, N'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/135.0.0.0 Safari/537.36', NULL, NULL, NULL, 1, NULL)
GO
INSERT [dbo].[AbpAuditLogs] ([Id], [TenantId], [UserId], [ServiceName], [MethodName], [Parameters], [ReturnValue], [ExecutionTime], [ExecutionDuration], [ClientIpAddress], [ClientName], [BrowserInfo], [ExceptionMessage], [Exception], [ImpersonatorUserId], [ImpersonatorTenantId], [CustomData]) VALUES (436, 1, 2, N'School.LMS.EducationalFeePlan.EducationFeeService', N'GetAllEducationalFees', N'{}', NULL, CAST(N'2025-05-09T15:03:58.8631609' AS DateTime2), 1419, N'::1', NULL, N'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/135.0.0.0 Safari/537.36', NULL, NULL, NULL, 1, NULL)
GO
INSERT [dbo].[AbpAuditLogs] ([Id], [TenantId], [UserId], [ServiceName], [MethodName], [Parameters], [ReturnValue], [ExecutionTime], [ExecutionDuration], [ClientIpAddress], [ClientName], [BrowserInfo], [ExceptionMessage], [Exception], [ImpersonatorUserId], [ImpersonatorTenantId], [CustomData]) VALUES (437, 1, 2, N'School.LMS.EducationalFeePlan.EducationFeeService', N'GetAllEducationalFees', N'{}', NULL, CAST(N'2025-05-09T15:03:58.9136636' AS DateTime2), 1397, N'::1', NULL, N'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/135.0.0.0 Safari/537.36', NULL, NULL, NULL, 1, NULL)
GO
INSERT [dbo].[AbpAuditLogs] ([Id], [TenantId], [UserId], [ServiceName], [MethodName], [Parameters], [ReturnValue], [ExecutionTime], [ExecutionDuration], [ClientIpAddress], [ClientName], [BrowserInfo], [ExceptionMessage], [Exception], [ImpersonatorUserId], [ImpersonatorTenantId], [CustomData]) VALUES (438, 1, 2, N'School.LMS.Students.StudentImportService', N'GetAllAsync', N'{"input":{"keyword":null}}', NULL, CAST(N'2025-05-09T15:03:58.9349789' AS DateTime2), 2284, N'::1', NULL, N'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/135.0.0.0 Safari/537.36', NULL, NULL, NULL, 1, NULL)
GO
INSERT [dbo].[AbpAuditLogs] ([Id], [TenantId], [UserId], [ServiceName], [MethodName], [Parameters], [ReturnValue], [ExecutionTime], [ExecutionDuration], [ClientIpAddress], [ClientName], [BrowserInfo], [ExceptionMessage], [Exception], [ImpersonatorUserId], [ImpersonatorTenantId], [CustomData]) VALUES (439, 1, NULL, N'School.LMS.Web.Host.Controllers.HomeController', N'Index', N'{}', NULL, CAST(N'2025-05-09T15:07:00.4335965' AS DateTime2), 46, N'::1', NULL, N'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/135.0.0.0 Safari/537.36', NULL, NULL, NULL, 1, NULL)
GO
INSERT [dbo].[AbpAuditLogs] ([Id], [TenantId], [UserId], [ServiceName], [MethodName], [Parameters], [ReturnValue], [ExecutionTime], [ExecutionDuration], [ClientIpAddress], [ClientName], [BrowserInfo], [ExceptionMessage], [Exception], [ImpersonatorUserId], [ImpersonatorTenantId], [CustomData]) VALUES (440, 1, NULL, N'Abp.AspNetCore.Mvc.Controllers.AbpUserConfigurationController', N'GetAll', N'{}', NULL, CAST(N'2025-05-09T15:07:00.4336105' AS DateTime2), 1520, N'::1', NULL, N'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/135.0.0.0 Safari/537.36', NULL, NULL, NULL, 1, NULL)
GO
INSERT [dbo].[AbpAuditLogs] ([Id], [TenantId], [UserId], [ServiceName], [MethodName], [Parameters], [ReturnValue], [ExecutionTime], [ExecutionDuration], [ClientIpAddress], [ClientName], [BrowserInfo], [ExceptionMessage], [Exception], [ImpersonatorUserId], [ImpersonatorTenantId], [CustomData]) VALUES (441, 1, NULL, N'School.LMS.Web.Host.Controllers.AntiForgeryController', N'SetCookie', N'{}', NULL, CAST(N'2025-05-09T15:07:13.2821280' AS DateTime2), 33, N'::1', NULL, N'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/135.0.0.0 Safari/537.36', NULL, NULL, NULL, 1, NULL)
GO
INSERT [dbo].[AbpAuditLogs] ([Id], [TenantId], [UserId], [ServiceName], [MethodName], [Parameters], [ReturnValue], [ExecutionTime], [ExecutionDuration], [ClientIpAddress], [ClientName], [BrowserInfo], [ExceptionMessage], [Exception], [ImpersonatorUserId], [ImpersonatorTenantId], [CustomData]) VALUES (442, 1, NULL, N'School.LMS.Controllers.TokenAuthController', N'Authenticate', N'{"model":{"userNameOrEmailAddress":"01234267685","rememberClient":false}}', NULL, CAST(N'2025-05-09T15:07:34.7092360' AS DateTime2), 2083, N'::1', NULL, N'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/135.0.0.0 Safari/537.36', NULL, NULL, NULL, 1, NULL)
GO
INSERT [dbo].[AbpAuditLogs] ([Id], [TenantId], [UserId], [ServiceName], [MethodName], [Parameters], [ReturnValue], [ExecutionTime], [ExecutionDuration], [ClientIpAddress], [ClientName], [BrowserInfo], [ExceptionMessage], [Exception], [ImpersonatorUserId], [ImpersonatorTenantId], [CustomData]) VALUES (443, 1, 5, N'Abp.AspNetCore.Mvc.Controllers.AbpUserConfigurationController', N'GetAll', N'{}', NULL, CAST(N'2025-05-09T15:07:39.6555109' AS DateTime2), 670, N'::1', NULL, N'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/135.0.0.0 Safari/537.36', NULL, NULL, NULL, 1, NULL)
GO
INSERT [dbo].[AbpAuditLogs] ([Id], [TenantId], [UserId], [ServiceName], [MethodName], [Parameters], [ReturnValue], [ExecutionTime], [ExecutionDuration], [ClientIpAddress], [ClientName], [BrowserInfo], [ExceptionMessage], [Exception], [ImpersonatorUserId], [ImpersonatorTenantId], [CustomData]) VALUES (444, 1, 5, N'School.LMS.StudentEducationalPayment.StudentPaymentAppService', N'GetStudentByName', N'{"studentName":"Ehab Osama"}', NULL, CAST(N'2025-05-09T15:08:10.6078458' AS DateTime2), 165, N'::1', NULL, N'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/135.0.0.0 Safari/537.36', NULL, NULL, NULL, 1, NULL)
GO
INSERT [dbo].[AbpAuditLogs] ([Id], [TenantId], [UserId], [ServiceName], [MethodName], [Parameters], [ReturnValue], [ExecutionTime], [ExecutionDuration], [ClientIpAddress], [ClientName], [BrowserInfo], [ExceptionMessage], [Exception], [ImpersonatorUserId], [ImpersonatorTenantId], [CustomData]) VALUES (445, 1, 5, N'School.LMS.StudentEducationalPayment.StudentPaymentAppService', N'GetStudentPaymentDetailsAsync', N'{"studentId":"1127"}', NULL, CAST(N'2025-05-09T15:08:21.5710669' AS DateTime2), 1536, N'::1', NULL, N'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/135.0.0.0 Safari/537.36', NULL, NULL, NULL, 1, NULL)
GO
INSERT [dbo].[AbpAuditLogs] ([Id], [TenantId], [UserId], [ServiceName], [MethodName], [Parameters], [ReturnValue], [ExecutionTime], [ExecutionDuration], [ClientIpAddress], [ClientName], [BrowserInfo], [ExceptionMessage], [Exception], [ImpersonatorUserId], [ImpersonatorTenantId], [CustomData]) VALUES (446, 1, 5, N'School.LMS.StudentEducationalPayment.StudentPaymentAppService', N'SubmitEducationalPaymentAsync', N'{"input":{"studentId":1127,"isFullPayment":false,"amountPaid":9000.0,"paymentDate":"2025-05-09T15:10:29.065+03:00","selectedInstallmentIds":[22],"id":0}}', NULL, CAST(N'2025-05-09T15:10:29.5647783' AS DateTime2), 399, N'::1', NULL, N'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/135.0.0.0 Safari/537.36', NULL, NULL, NULL, 1, NULL)
GO
INSERT [dbo].[AbpAuditLogs] ([Id], [TenantId], [UserId], [ServiceName], [MethodName], [Parameters], [ReturnValue], [ExecutionTime], [ExecutionDuration], [ClientIpAddress], [ClientName], [BrowserInfo], [ExceptionMessage], [Exception], [ImpersonatorUserId], [ImpersonatorTenantId], [CustomData]) VALUES (447, 1, 5, N'Abp.AspNetCore.Mvc.Controllers.AbpUserConfigurationController', N'GetAll', N'{}', NULL, CAST(N'2025-05-09T15:10:35.1412894' AS DateTime2), 11, N'::1', NULL, N'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/135.0.0.0 Safari/537.36', NULL, NULL, NULL, 1, NULL)
GO
INSERT [dbo].[AbpAuditLogs] ([Id], [TenantId], [UserId], [ServiceName], [MethodName], [Parameters], [ReturnValue], [ExecutionTime], [ExecutionDuration], [ClientIpAddress], [ClientName], [BrowserInfo], [ExceptionMessage], [Exception], [ImpersonatorUserId], [ImpersonatorTenantId], [CustomData]) VALUES (448, 1, 5, N'School.LMS.StudentEducationalPayment.StudentPaymentAppService', N'GetStudentByName', N'{"studentName":"Ehab Osama"}', NULL, CAST(N'2025-05-09T15:10:36.2604411' AS DateTime2), 72, N'::1', NULL, N'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/135.0.0.0 Safari/537.36', NULL, NULL, NULL, 1, NULL)
GO
INSERT [dbo].[AbpAuditLogs] ([Id], [TenantId], [UserId], [ServiceName], [MethodName], [Parameters], [ReturnValue], [ExecutionTime], [ExecutionDuration], [ClientIpAddress], [ClientName], [BrowserInfo], [ExceptionMessage], [Exception], [ImpersonatorUserId], [ImpersonatorTenantId], [CustomData]) VALUES (449, 1, 5, N'School.LMS.StudentEducationalPayment.StudentPaymentAppService', N'GetStudentPaymentDetailsAsync', N'{"studentId":"1127"}', NULL, CAST(N'2025-05-09T15:10:36.7678836' AS DateTime2), 134, N'::1', NULL, N'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/135.0.0.0 Safari/537.36', NULL, NULL, NULL, 1, NULL)
GO
INSERT [dbo].[AbpAuditLogs] ([Id], [TenantId], [UserId], [ServiceName], [MethodName], [Parameters], [ReturnValue], [ExecutionTime], [ExecutionDuration], [ClientIpAddress], [ClientName], [BrowserInfo], [ExceptionMessage], [Exception], [ImpersonatorUserId], [ImpersonatorTenantId], [CustomData]) VALUES (450, 1, 5, N'School.LMS.Roles.RoleAppService', N'GetAllAsync', N'{"input":{"keyword":null,"skipCount":0,"maxResultCount":10}}', NULL, CAST(N'2025-05-09T15:13:48.1590309' AS DateTime2), 640, N'::1', NULL, N'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/135.0.0.0 Safari/537.36', NULL, NULL, NULL, 1, NULL)
GO
INSERT [dbo].[AbpAuditLogs] ([Id], [TenantId], [UserId], [ServiceName], [MethodName], [Parameters], [ReturnValue], [ExecutionTime], [ExecutionDuration], [ClientIpAddress], [ClientName], [BrowserInfo], [ExceptionMessage], [Exception], [ImpersonatorUserId], [ImpersonatorTenantId], [CustomData]) VALUES (451, 1, 5, N'School.LMS.StudentEducationalPayment.StudentPaymentAppService', N'GetStudentByName', N'{"studentName":"Ehab Osama"}', NULL, CAST(N'2025-05-09T15:14:17.1226919' AS DateTime2), 129, N'::1', NULL, N'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/135.0.0.0 Safari/537.36', NULL, NULL, NULL, 1, NULL)
GO
INSERT [dbo].[AbpAuditLogs] ([Id], [TenantId], [UserId], [ServiceName], [MethodName], [Parameters], [ReturnValue], [ExecutionTime], [ExecutionDuration], [ClientIpAddress], [ClientName], [BrowserInfo], [ExceptionMessage], [Exception], [ImpersonatorUserId], [ImpersonatorTenantId], [CustomData]) VALUES (452, 1, 5, N'School.LMS.StudentEducationalPayment.StudentPaymentAppService', N'GetStudentPaymentDetailsAsync', N'{"studentId":"1127"}', NULL, CAST(N'2025-05-09T15:14:18.0960431' AS DateTime2), 275, N'::1', NULL, N'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/135.0.0.0 Safari/537.36', NULL, NULL, NULL, 1, NULL)
GO
SET IDENTITY_INSERT [dbo].[AbpAuditLogs] OFF
GO
SET IDENTITY_INSERT [dbo].[AbpEditions] ON 
GO
INSERT [dbo].[AbpEditions] ([Id], [Name], [DisplayName], [CreationTime], [CreatorUserId], [LastModificationTime], [LastModifierUserId], [IsDeleted], [DeleterUserId], [DeletionTime]) VALUES (1, N'Standard', N'Standard', CAST(N'2025-05-06T20:39:09.8326315' AS DateTime2), NULL, NULL, NULL, 0, NULL, NULL)
GO
SET IDENTITY_INSERT [dbo].[AbpEditions] OFF
GO
SET IDENTITY_INSERT [dbo].[AbpLanguages] ON 
GO
INSERT [dbo].[AbpLanguages] ([Id], [TenantId], [Name], [DisplayName], [Icon], [IsDisabled], [CreationTime], [CreatorUserId], [LastModificationTime], [LastModifierUserId], [IsDeleted], [DeleterUserId], [DeletionTime]) VALUES (1, NULL, N'en', N'English', N'famfamfam-flags us', 0, CAST(N'2025-05-06T20:39:10.0934817' AS DateTime2), NULL, NULL, NULL, 0, NULL, NULL)
GO
INSERT [dbo].[AbpLanguages] ([Id], [TenantId], [Name], [DisplayName], [Icon], [IsDisabled], [CreationTime], [CreatorUserId], [LastModificationTime], [LastModifierUserId], [IsDeleted], [DeleterUserId], [DeletionTime]) VALUES (2, NULL, N'ar', N'العربية', N'famfamfam-flags sa', 0, CAST(N'2025-05-06T20:39:10.0936825' AS DateTime2), NULL, NULL, NULL, 0, NULL, NULL)
GO
INSERT [dbo].[AbpLanguages] ([Id], [TenantId], [Name], [DisplayName], [Icon], [IsDisabled], [CreationTime], [CreatorUserId], [LastModificationTime], [LastModifierUserId], [IsDeleted], [DeleterUserId], [DeletionTime]) VALUES (3, NULL, N'de', N'German', N'famfamfam-flags de', 0, CAST(N'2025-05-06T20:39:10.0936844' AS DateTime2), NULL, NULL, NULL, 0, NULL, NULL)
GO
INSERT [dbo].[AbpLanguages] ([Id], [TenantId], [Name], [DisplayName], [Icon], [IsDisabled], [CreationTime], [CreatorUserId], [LastModificationTime], [LastModifierUserId], [IsDeleted], [DeleterUserId], [DeletionTime]) VALUES (4, NULL, N'it', N'Italiano', N'famfamfam-flags it', 0, CAST(N'2025-05-06T20:39:10.0936849' AS DateTime2), NULL, NULL, NULL, 0, NULL, NULL)
GO
INSERT [dbo].[AbpLanguages] ([Id], [TenantId], [Name], [DisplayName], [Icon], [IsDisabled], [CreationTime], [CreatorUserId], [LastModificationTime], [LastModifierUserId], [IsDeleted], [DeleterUserId], [DeletionTime]) VALUES (5, NULL, N'fa', N'فارسی', N'famfamfam-flags ir', 0, CAST(N'2025-05-06T20:39:10.0936852' AS DateTime2), NULL, NULL, NULL, 0, NULL, NULL)
GO
INSERT [dbo].[AbpLanguages] ([Id], [TenantId], [Name], [DisplayName], [Icon], [IsDisabled], [CreationTime], [CreatorUserId], [LastModificationTime], [LastModifierUserId], [IsDeleted], [DeleterUserId], [DeletionTime]) VALUES (6, NULL, N'fr', N'Français', N'famfamfam-flags fr', 0, CAST(N'2025-05-06T20:39:10.0936861' AS DateTime2), NULL, NULL, NULL, 0, NULL, NULL)
GO
INSERT [dbo].[AbpLanguages] ([Id], [TenantId], [Name], [DisplayName], [Icon], [IsDisabled], [CreationTime], [CreatorUserId], [LastModificationTime], [LastModifierUserId], [IsDeleted], [DeleterUserId], [DeletionTime]) VALUES (7, NULL, N'pt-BR', N'Português', N'famfamfam-flags br', 0, CAST(N'2025-05-06T20:39:10.0936866' AS DateTime2), NULL, NULL, NULL, 0, NULL, NULL)
GO
INSERT [dbo].[AbpLanguages] ([Id], [TenantId], [Name], [DisplayName], [Icon], [IsDisabled], [CreationTime], [CreatorUserId], [LastModificationTime], [LastModifierUserId], [IsDeleted], [DeleterUserId], [DeletionTime]) VALUES (8, NULL, N'tr', N'Türkçe', N'famfamfam-flags tr', 0, CAST(N'2025-05-06T20:39:10.0936869' AS DateTime2), NULL, NULL, NULL, 0, NULL, NULL)
GO
INSERT [dbo].[AbpLanguages] ([Id], [TenantId], [Name], [DisplayName], [Icon], [IsDisabled], [CreationTime], [CreatorUserId], [LastModificationTime], [LastModifierUserId], [IsDeleted], [DeleterUserId], [DeletionTime]) VALUES (9, NULL, N'ru', N'Русский', N'famfamfam-flags ru', 0, CAST(N'2025-05-06T20:39:10.0936871' AS DateTime2), NULL, NULL, NULL, 0, NULL, NULL)
GO
INSERT [dbo].[AbpLanguages] ([Id], [TenantId], [Name], [DisplayName], [Icon], [IsDisabled], [CreationTime], [CreatorUserId], [LastModificationTime], [LastModifierUserId], [IsDeleted], [DeleterUserId], [DeletionTime]) VALUES (10, NULL, N'zh-Hans', N'简体中文', N'famfamfam-flags cn', 0, CAST(N'2025-05-06T20:39:10.0936876' AS DateTime2), NULL, NULL, NULL, 0, NULL, NULL)
GO
INSERT [dbo].[AbpLanguages] ([Id], [TenantId], [Name], [DisplayName], [Icon], [IsDisabled], [CreationTime], [CreatorUserId], [LastModificationTime], [LastModifierUserId], [IsDeleted], [DeleterUserId], [DeletionTime]) VALUES (11, NULL, N'es-MX', N'Español México', N'famfamfam-flags mx', 0, CAST(N'2025-05-06T20:39:10.0936878' AS DateTime2), NULL, NULL, NULL, 0, NULL, NULL)
GO
INSERT [dbo].[AbpLanguages] ([Id], [TenantId], [Name], [DisplayName], [Icon], [IsDisabled], [CreationTime], [CreatorUserId], [LastModificationTime], [LastModifierUserId], [IsDeleted], [DeleterUserId], [DeletionTime]) VALUES (12, NULL, N'nl', N'Nederlands', N'famfamfam-flags nl', 0, CAST(N'2025-05-06T20:39:10.0936880' AS DateTime2), NULL, NULL, NULL, 0, NULL, NULL)
GO
INSERT [dbo].[AbpLanguages] ([Id], [TenantId], [Name], [DisplayName], [Icon], [IsDisabled], [CreationTime], [CreatorUserId], [LastModificationTime], [LastModifierUserId], [IsDeleted], [DeleterUserId], [DeletionTime]) VALUES (13, NULL, N'ja', N'日本語', N'famfamfam-flags jp', 0, CAST(N'2025-05-06T20:39:10.0936883' AS DateTime2), NULL, NULL, NULL, 0, NULL, NULL)
GO
SET IDENTITY_INSERT [dbo].[AbpLanguages] OFF
GO
SET IDENTITY_INSERT [dbo].[AbpPermissions] ON 
GO
INSERT [dbo].[AbpPermissions] ([Id], [TenantId], [Name], [IsGranted], [Discriminator], [RoleId], [UserId], [CreationTime], [CreatorUserId]) VALUES (1, NULL, N'Pages.Users', 1, N'RolePermissionSetting', 1, NULL, CAST(N'2025-05-06T20:39:10.3350917' AS DateTime2), NULL)
GO
INSERT [dbo].[AbpPermissions] ([Id], [TenantId], [Name], [IsGranted], [Discriminator], [RoleId], [UserId], [CreationTime], [CreatorUserId]) VALUES (2, NULL, N'Pages.Users.Activation', 1, N'RolePermissionSetting', 1, NULL, CAST(N'2025-05-06T20:39:10.3618826' AS DateTime2), NULL)
GO
INSERT [dbo].[AbpPermissions] ([Id], [TenantId], [Name], [IsGranted], [Discriminator], [RoleId], [UserId], [CreationTime], [CreatorUserId]) VALUES (3, NULL, N'Pages.Roles', 1, N'RolePermissionSetting', 1, NULL, CAST(N'2025-05-06T20:39:10.3620898' AS DateTime2), NULL)
GO
INSERT [dbo].[AbpPermissions] ([Id], [TenantId], [Name], [IsGranted], [Discriminator], [RoleId], [UserId], [CreationTime], [CreatorUserId]) VALUES (4, NULL, N'Pages.Tenants', 1, N'RolePermissionSetting', 1, NULL, CAST(N'2025-05-06T20:39:10.3621444' AS DateTime2), NULL)
GO
INSERT [dbo].[AbpPermissions] ([Id], [TenantId], [Name], [IsGranted], [Discriminator], [RoleId], [UserId], [CreationTime], [CreatorUserId]) VALUES (5, 1, N'Pages.Users', 1, N'RolePermissionSetting', 2, NULL, CAST(N'2025-05-06T20:39:38.2411679' AS DateTime2), NULL)
GO
INSERT [dbo].[AbpPermissions] ([Id], [TenantId], [Name], [IsGranted], [Discriminator], [RoleId], [UserId], [CreationTime], [CreatorUserId]) VALUES (6, 1, N'Pages.Users.Activation', 1, N'RolePermissionSetting', 2, NULL, CAST(N'2025-05-06T20:39:38.2414009' AS DateTime2), NULL)
GO
INSERT [dbo].[AbpPermissions] ([Id], [TenantId], [Name], [IsGranted], [Discriminator], [RoleId], [UserId], [CreationTime], [CreatorUserId]) VALUES (7, 1, N'Pages.Roles', 1, N'RolePermissionSetting', 2, NULL, CAST(N'2025-05-06T20:39:38.2414494' AS DateTime2), NULL)
GO
INSERT [dbo].[AbpPermissions] ([Id], [TenantId], [Name], [IsGranted], [Discriminator], [RoleId], [UserId], [CreationTime], [CreatorUserId]) VALUES (8, 1, N'Pages.Users', 1, N'RolePermissionSetting', 3, NULL, CAST(N'2025-05-06T20:39:44.8224956' AS DateTime2), NULL)
GO
INSERT [dbo].[AbpPermissions] ([Id], [TenantId], [Name], [IsGranted], [Discriminator], [RoleId], [UserId], [CreationTime], [CreatorUserId]) VALUES (9, 1, N'Pages.Users.Activation', 1, N'RolePermissionSetting', 3, NULL, CAST(N'2025-05-06T20:39:44.8227227' AS DateTime2), NULL)
GO
INSERT [dbo].[AbpPermissions] ([Id], [TenantId], [Name], [IsGranted], [Discriminator], [RoleId], [UserId], [CreationTime], [CreatorUserId]) VALUES (10, 1, N'Pages.Roles', 1, N'RolePermissionSetting', 3, NULL, CAST(N'2025-05-06T20:39:44.8228109' AS DateTime2), NULL)
GO
SET IDENTITY_INSERT [dbo].[AbpPermissions] OFF
GO
SET IDENTITY_INSERT [dbo].[AbpRoles] ON 
GO
INSERT [dbo].[AbpRoles] ([Id], [Description], [CreationTime], [CreatorUserId], [LastModificationTime], [LastModifierUserId], [IsDeleted], [DeleterUserId], [DeletionTime], [TenantId], [Name], [DisplayName], [IsStatic], [IsDefault], [NormalizedName], [ConcurrencyStamp]) VALUES (1, NULL, CAST(N'2025-05-06T20:39:10.2465972' AS DateTime2), NULL, NULL, NULL, 0, NULL, NULL, NULL, N'Admin', N'Admin', 1, 1, N'ADMIN', N'2c3b3711-e322-495d-9e6e-5276c231fb40')
GO
INSERT [dbo].[AbpRoles] ([Id], [Description], [CreationTime], [CreatorUserId], [LastModificationTime], [LastModifierUserId], [IsDeleted], [DeleterUserId], [DeletionTime], [TenantId], [Name], [DisplayName], [IsStatic], [IsDefault], [NormalizedName], [ConcurrencyStamp]) VALUES (2, NULL, CAST(N'2025-05-06T20:39:21.5428382' AS DateTime2), NULL, NULL, NULL, 0, NULL, NULL, 1, N'Admin', N'Admin', 1, 0, N'ADMIN', N'b10b94a8-9bcf-48d3-b898-efd2e48fa6f1')
GO
INSERT [dbo].[AbpRoles] ([Id], [Description], [CreationTime], [CreatorUserId], [LastModificationTime], [LastModifierUserId], [IsDeleted], [DeleterUserId], [DeletionTime], [TenantId], [Name], [DisplayName], [IsStatic], [IsDefault], [NormalizedName], [ConcurrencyStamp]) VALUES (3, NULL, CAST(N'2025-05-06T20:39:44.8089592' AS DateTime2), NULL, NULL, NULL, 0, NULL, NULL, 1, N'Student', N'Student', 1, 0, N'STUDENT', N'36a0b7a0-2423-45ae-aee2-3fbad0b6bb70')
GO
SET IDENTITY_INSERT [dbo].[AbpRoles] OFF
GO
SET IDENTITY_INSERT [dbo].[AbpSettings] ON 
GO
INSERT [dbo].[AbpSettings] ([Id], [TenantId], [UserId], [Name], [Value], [CreationTime], [CreatorUserId], [LastModificationTime], [LastModifierUserId]) VALUES (1, NULL, NULL, N'Abp.Net.Mail.DefaultFromAddress', N'admin@mydomain.com', CAST(N'2025-05-06T20:39:10.8215997' AS DateTime2), NULL, NULL, NULL)
GO
INSERT [dbo].[AbpSettings] ([Id], [TenantId], [UserId], [Name], [Value], [CreationTime], [CreatorUserId], [LastModificationTime], [LastModifierUserId]) VALUES (2, NULL, NULL, N'Abp.Net.Mail.DefaultFromDisplayName', N'mydomain.com mailer', CAST(N'2025-05-06T20:39:10.8710492' AS DateTime2), NULL, NULL, NULL)
GO
INSERT [dbo].[AbpSettings] ([Id], [TenantId], [UserId], [Name], [Value], [CreationTime], [CreatorUserId], [LastModificationTime], [LastModifierUserId]) VALUES (3, NULL, NULL, N'Abp.Localization.DefaultLanguageName', N'en', CAST(N'2025-05-06T20:39:10.8836312' AS DateTime2), NULL, NULL, NULL)
GO
INSERT [dbo].[AbpSettings] ([Id], [TenantId], [UserId], [Name], [Value], [CreationTime], [CreatorUserId], [LastModificationTime], [LastModifierUserId]) VALUES (4, 1, 2, N'Abp.Localization.DefaultLanguageName', N'en', CAST(N'2025-05-06T20:43:28.0000760' AS DateTime2), 2, NULL, NULL)
GO
INSERT [dbo].[AbpSettings] ([Id], [TenantId], [UserId], [Name], [Value], [CreationTime], [CreatorUserId], [LastModificationTime], [LastModifierUserId]) VALUES (5, 1, 3, N'Abp.Localization.DefaultLanguageName', N'en', CAST(N'2025-05-06T21:08:24.8410539' AS DateTime2), 3, CAST(N'2025-05-08T14:45:24.0686504' AS DateTime2), 3)
GO
INSERT [dbo].[AbpSettings] ([Id], [TenantId], [UserId], [Name], [Value], [CreationTime], [CreatorUserId], [LastModificationTime], [LastModifierUserId]) VALUES (6, 1, 4, N'Abp.Localization.DefaultLanguageName', N'en', CAST(N'2025-05-08T14:50:08.4565220' AS DateTime2), 4, NULL, NULL)
GO
INSERT [dbo].[AbpSettings] ([Id], [TenantId], [UserId], [Name], [Value], [CreationTime], [CreatorUserId], [LastModificationTime], [LastModifierUserId]) VALUES (7, 1, 5, N'Abp.Localization.DefaultLanguageName', N'en', CAST(N'2025-05-08T15:46:17.7377116' AS DateTime2), 5, NULL, NULL)
GO
SET IDENTITY_INSERT [dbo].[AbpSettings] OFF
GO
SET IDENTITY_INSERT [dbo].[AbpTenants] ON 
GO
INSERT [dbo].[AbpTenants] ([Id], [CreationTime], [CreatorUserId], [LastModificationTime], [LastModifierUserId], [IsDeleted], [DeleterUserId], [DeletionTime], [TenancyName], [Name], [ConnectionString], [IsActive], [EditionId]) VALUES (1, CAST(N'2025-05-06T20:39:10.9008293' AS DateTime2), NULL, NULL, NULL, 0, NULL, NULL, N'Default', N'Default', NULL, 1, 1)
GO
SET IDENTITY_INSERT [dbo].[AbpTenants] OFF
GO
SET IDENTITY_INSERT [dbo].[AbpUserAccounts] ON 
GO
INSERT [dbo].[AbpUserAccounts] ([Id], [TenantId], [UserId], [UserLinkId], [UserName], [EmailAddress], [CreationTime], [CreatorUserId], [LastModificationTime], [LastModifierUserId], [IsDeleted], [DeleterUserId], [DeletionTime]) VALUES (1, NULL, 1, NULL, N'admin', N'admin@aspnetboilerplate.com', CAST(N'2025-05-06T20:39:10.7200372' AS DateTime2), NULL, NULL, NULL, 0, NULL, NULL)
GO
INSERT [dbo].[AbpUserAccounts] ([Id], [TenantId], [UserId], [UserLinkId], [UserName], [EmailAddress], [CreationTime], [CreatorUserId], [LastModificationTime], [LastModifierUserId], [IsDeleted], [DeleterUserId], [DeletionTime]) VALUES (2, 1, 2, NULL, N'admin', N'admin@defaulttenant.com', CAST(N'2025-05-06T20:39:44.7800646' AS DateTime2), NULL, NULL, NULL, 0, NULL, NULL)
GO
INSERT [dbo].[AbpUserAccounts] ([Id], [TenantId], [UserId], [UserLinkId], [UserName], [EmailAddress], [CreationTime], [CreatorUserId], [LastModificationTime], [LastModifierUserId], [IsDeleted], [DeleterUserId], [DeletionTime]) VALUES (3, 1, 3, NULL, N'01545646456', N'Ahmed Ali@LMS.com', CAST(N'2025-05-06T21:07:09.0529998' AS DateTime2), NULL, NULL, NULL, 0, NULL, NULL)
GO
INSERT [dbo].[AbpUserAccounts] ([Id], [TenantId], [UserId], [UserLinkId], [UserName], [EmailAddress], [CreationTime], [CreatorUserId], [LastModificationTime], [LastModifierUserId], [IsDeleted], [DeleterUserId], [DeletionTime]) VALUES (4, 1, 4, NULL, N'01014267914', N'Mohamed Abdelmonem@LMS.com', CAST(N'2025-05-06T21:07:15.2575151' AS DateTime2), NULL, NULL, NULL, 0, NULL, NULL)
GO
INSERT [dbo].[AbpUserAccounts] ([Id], [TenantId], [UserId], [UserLinkId], [UserName], [EmailAddress], [CreationTime], [CreatorUserId], [LastModificationTime], [LastModifierUserId], [IsDeleted], [DeleterUserId], [DeletionTime]) VALUES (5, 1, 5, NULL, N'01234267685', N'Ehab Osama@LMS.com', CAST(N'2025-05-06T21:07:15.4013500' AS DateTime2), NULL, NULL, NULL, 0, NULL, NULL)
GO
SET IDENTITY_INSERT [dbo].[AbpUserAccounts] OFF
GO
SET IDENTITY_INSERT [dbo].[AbpUserLoginAttempts] ON 
GO
INSERT [dbo].[AbpUserLoginAttempts] ([Id], [TenantId], [TenancyName], [UserId], [UserNameOrEmailAddress], [ClientIpAddress], [ClientName], [BrowserInfo], [Result], [FailReason], [CreationTime]) VALUES (1, 1, N'Default', 2, N'admin', N'::1', NULL, N'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/135.0.0.0 Safari/537.36', 1, N'', CAST(N'2025-05-06T20:43:27.4872920' AS DateTime2))
GO
INSERT [dbo].[AbpUserLoginAttempts] ([Id], [TenantId], [TenancyName], [UserId], [UserNameOrEmailAddress], [ClientIpAddress], [ClientName], [BrowserInfo], [Result], [FailReason], [CreationTime]) VALUES (2, 1, N'Default', 2, N'admin', N'::1', NULL, N'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/135.0.0.0 Safari/537.36', 1, N'', CAST(N'2025-05-06T20:45:17.9428456' AS DateTime2))
GO
INSERT [dbo].[AbpUserLoginAttempts] ([Id], [TenantId], [TenancyName], [UserId], [UserNameOrEmailAddress], [ClientIpAddress], [ClientName], [BrowserInfo], [Result], [FailReason], [CreationTime]) VALUES (3, 1, N'Default', 3, N'01545646456', N'::1', NULL, N'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/135.0.0.0 Safari/537.36', 1, N'', CAST(N'2025-05-06T21:08:24.2025241' AS DateTime2))
GO
INSERT [dbo].[AbpUserLoginAttempts] ([Id], [TenantId], [TenancyName], [UserId], [UserNameOrEmailAddress], [ClientIpAddress], [ClientName], [BrowserInfo], [Result], [FailReason], [CreationTime]) VALUES (4, 1, N'Default', 2, N'admin', N'::1', NULL, N'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/135.0.0.0 Safari/537.36', 1, N'', CAST(N'2025-05-08T13:23:53.7896671' AS DateTime2))
GO
INSERT [dbo].[AbpUserLoginAttempts] ([Id], [TenantId], [TenancyName], [UserId], [UserNameOrEmailAddress], [ClientIpAddress], [ClientName], [BrowserInfo], [Result], [FailReason], [CreationTime]) VALUES (5, 1, N'Default', 3, N'01545646456', N'::1', NULL, N'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/135.0.0.0 Safari/537.36', 1, N'', CAST(N'2025-05-08T13:25:44.6069096' AS DateTime2))
GO
INSERT [dbo].[AbpUserLoginAttempts] ([Id], [TenantId], [TenancyName], [UserId], [UserNameOrEmailAddress], [ClientIpAddress], [ClientName], [BrowserInfo], [Result], [FailReason], [CreationTime]) VALUES (6, 1, N'Default', 3, N'01545646456', N'::1', NULL, N'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/135.0.0.0 Safari/537.36', 1, N'', CAST(N'2025-05-08T13:31:14.9369755' AS DateTime2))
GO
INSERT [dbo].[AbpUserLoginAttempts] ([Id], [TenantId], [TenancyName], [UserId], [UserNameOrEmailAddress], [ClientIpAddress], [ClientName], [BrowserInfo], [Result], [FailReason], [CreationTime]) VALUES (7, 1, N'Default', 4, N'01014267914', N'::1', NULL, N'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/135.0.0.0 Safari/537.36', 1, N'', CAST(N'2025-05-08T14:50:07.1924633' AS DateTime2))
GO
INSERT [dbo].[AbpUserLoginAttempts] ([Id], [TenantId], [TenancyName], [UserId], [UserNameOrEmailAddress], [ClientIpAddress], [ClientName], [BrowserInfo], [Result], [FailReason], [CreationTime]) VALUES (8, 1, N'Default', 2, N'admin', N'::1', NULL, N'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/135.0.0.0 Safari/537.36', 1, N'', CAST(N'2025-05-08T15:30:20.2443361' AS DateTime2))
GO
INSERT [dbo].[AbpUserLoginAttempts] ([Id], [TenantId], [TenancyName], [UserId], [UserNameOrEmailAddress], [ClientIpAddress], [ClientName], [BrowserInfo], [Result], [FailReason], [CreationTime]) VALUES (9, 1, N'Default', 2, N'admin', N'::1', NULL, N'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/135.0.0.0 Safari/537.36', 1, N'', CAST(N'2025-05-08T15:36:53.0797311' AS DateTime2))
GO
INSERT [dbo].[AbpUserLoginAttempts] ([Id], [TenantId], [TenancyName], [UserId], [UserNameOrEmailAddress], [ClientIpAddress], [ClientName], [BrowserInfo], [Result], [FailReason], [CreationTime]) VALUES (10, 1, N'Default', 3, N'01545646456', N'::1', NULL, N'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/135.0.0.0 Safari/537.36', 1, N'', CAST(N'2025-05-08T15:43:37.4564303' AS DateTime2))
GO
INSERT [dbo].[AbpUserLoginAttempts] ([Id], [TenantId], [TenancyName], [UserId], [UserNameOrEmailAddress], [ClientIpAddress], [ClientName], [BrowserInfo], [Result], [FailReason], [CreationTime]) VALUES (11, 1, N'Default', 4, N'01014267914', N'::1', NULL, N'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/135.0.0.0 Safari/537.36', 1, N'', CAST(N'2025-05-08T15:44:20.2945369' AS DateTime2))
GO
INSERT [dbo].[AbpUserLoginAttempts] ([Id], [TenantId], [TenancyName], [UserId], [UserNameOrEmailAddress], [ClientIpAddress], [ClientName], [BrowserInfo], [Result], [FailReason], [CreationTime]) VALUES (12, 1, N'Default', 5, N'01234267685', N'::1', NULL, N'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/135.0.0.0 Safari/537.36', 1, N'', CAST(N'2025-05-08T15:46:17.1469137' AS DateTime2))
GO
INSERT [dbo].[AbpUserLoginAttempts] ([Id], [TenantId], [TenancyName], [UserId], [UserNameOrEmailAddress], [ClientIpAddress], [ClientName], [BrowserInfo], [Result], [FailReason], [CreationTime]) VALUES (13, 1, N'Default', 2, N'admin', N'::1', NULL, N'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/135.0.0.0 Safari/537.36', 1, N'', CAST(N'2025-05-09T15:02:58.1007383' AS DateTime2))
GO
INSERT [dbo].[AbpUserLoginAttempts] ([Id], [TenantId], [TenancyName], [UserId], [UserNameOrEmailAddress], [ClientIpAddress], [ClientName], [BrowserInfo], [Result], [FailReason], [CreationTime]) VALUES (14, 1, N'Default', 5, N'01234267685', N'::1', NULL, N'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/135.0.0.0 Safari/537.36', 1, N'', CAST(N'2025-05-09T15:07:36.3796108' AS DateTime2))
GO
SET IDENTITY_INSERT [dbo].[AbpUserLoginAttempts] OFF
GO
SET IDENTITY_INSERT [dbo].[AbpUserRoles] ON 
GO
INSERT [dbo].[AbpUserRoles] ([Id], [TenantId], [UserId], [RoleId], [CreationTime], [CreatorUserId]) VALUES (1, NULL, 1, 1, CAST(N'2025-05-06T20:39:10.7688143' AS DateTime2), NULL)
GO
INSERT [dbo].[AbpUserRoles] ([Id], [TenantId], [UserId], [RoleId], [CreationTime], [CreatorUserId]) VALUES (2, 1, 2, 2, CAST(N'2025-05-06T20:39:44.7895503' AS DateTime2), NULL)
GO
INSERT [dbo].[AbpUserRoles] ([Id], [TenantId], [UserId], [RoleId], [CreationTime], [CreatorUserId]) VALUES (3, 1, 3, 3, CAST(N'2025-05-06T21:07:10.7755601' AS DateTime2), NULL)
GO
INSERT [dbo].[AbpUserRoles] ([Id], [TenantId], [UserId], [RoleId], [CreationTime], [CreatorUserId]) VALUES (4, 1, 4, 3, CAST(N'2025-05-06T21:07:15.2640151' AS DateTime2), NULL)
GO
INSERT [dbo].[AbpUserRoles] ([Id], [TenantId], [UserId], [RoleId], [CreationTime], [CreatorUserId]) VALUES (5, 1, 5, 3, CAST(N'2025-05-06T21:07:15.4080514' AS DateTime2), NULL)
GO
SET IDENTITY_INSERT [dbo].[AbpUserRoles] OFF
GO
SET IDENTITY_INSERT [dbo].[AbpUsers] ON 
GO
INSERT [dbo].[AbpUsers] ([Id], [CreationTime], [CreatorUserId], [LastModificationTime], [LastModifierUserId], [IsDeleted], [DeleterUserId], [DeletionTime], [AuthenticationSource], [UserName], [TenantId], [EmailAddress], [Name], [Surname], [Password], [EmailConfirmationCode], [PasswordResetCode], [LockoutEndDateUtc], [AccessFailedCount], [IsLockoutEnabled], [PhoneNumber], [IsPhoneNumberConfirmed], [SecurityStamp], [IsTwoFactorEnabled], [IsEmailConfirmed], [IsActive], [NormalizedUserName], [NormalizedEmailAddress], [ConcurrencyStamp]) VALUES (1, CAST(N'2025-05-06T20:39:10.4178288' AS DateTime2), NULL, NULL, NULL, 0, NULL, NULL, NULL, N'admin', NULL, N'admin@aspnetboilerplate.com', N'admin', N'admin', N'AQAAAAIAAYagAAAAEDP1c71+MPFjeOv49oByKVqbiWs8PY1DvfpB7ieafg82TVu61CTM5s1J2ZRvpJM5GQ==', NULL, NULL, NULL, 0, 0, NULL, 0, N'25af71e0-f16a-6e39-046c-3a19b8daf3d2', 0, 1, 1, N'ADMIN', N'ADMIN@ASPNETBOILERPLATE.COM', N'adb80108-d5f3-4263-a9de-5e17a668eff4')
GO
INSERT [dbo].[AbpUsers] ([Id], [CreationTime], [CreatorUserId], [LastModificationTime], [LastModifierUserId], [IsDeleted], [DeleterUserId], [DeletionTime], [AuthenticationSource], [UserName], [TenantId], [EmailAddress], [Name], [Surname], [Password], [EmailConfirmationCode], [PasswordResetCode], [LockoutEndDateUtc], [AccessFailedCount], [IsLockoutEnabled], [PhoneNumber], [IsPhoneNumberConfirmed], [SecurityStamp], [IsTwoFactorEnabled], [IsEmailConfirmed], [IsActive], [NormalizedUserName], [NormalizedEmailAddress], [ConcurrencyStamp]) VALUES (2, CAST(N'2025-05-06T20:39:42.4131731' AS DateTime2), NULL, NULL, NULL, 0, NULL, NULL, NULL, N'admin', 1, N'admin@defaulttenant.com', N'admin', N'admin', N'AQAAAAIAAYagAAAAEINf+dS0KnlLd9EPx7WIm1Qn2j8fsnUvNadvML2hMZ03PYJ78nSzUKpzoLJgvmWmWQ==', NULL, NULL, NULL, 0, 0, NULL, 0, N'5fdd93b6-e38f-b074-b27f-3a19b8db70cd', 0, 1, 1, N'ADMIN', N'ADMIN@DEFAULTTENANT.COM', N'0de4c2cf-758b-403c-9826-624963a794a3')
GO
INSERT [dbo].[AbpUsers] ([Id], [CreationTime], [CreatorUserId], [LastModificationTime], [LastModifierUserId], [IsDeleted], [DeleterUserId], [DeletionTime], [AuthenticationSource], [UserName], [TenantId], [EmailAddress], [Name], [Surname], [Password], [EmailConfirmationCode], [PasswordResetCode], [LockoutEndDateUtc], [AccessFailedCount], [IsLockoutEnabled], [PhoneNumber], [IsPhoneNumberConfirmed], [SecurityStamp], [IsTwoFactorEnabled], [IsEmailConfirmed], [IsActive], [NormalizedUserName], [NormalizedEmailAddress], [ConcurrencyStamp]) VALUES (3, CAST(N'2025-05-06T21:07:05.5245227' AS DateTime2), NULL, NULL, NULL, 0, NULL, NULL, NULL, N'01545646456', 1, N'Ahmed Ali@LMS.com', N'Ahmed Ali', N'Ahmed Ali', N'AQAAAAIAAYagAAAAEA1YLCwT3Py/Zig+azLZvAQneQSBTiCrNAO38ALvlNZqpHU5TfQZ2w/wM5aBQnULVg==', NULL, NULL, NULL, 0, 0, NULL, 0, N'8c254d58-1ce2-32fa-f10c-3a19b8f48334', 0, 1, 1, N'01545646456', N'AHMED ALI@LMS.COM', N'6703a8f4-ba27-481d-bbec-3d326de5220b')
GO
INSERT [dbo].[AbpUsers] ([Id], [CreationTime], [CreatorUserId], [LastModificationTime], [LastModifierUserId], [IsDeleted], [DeleterUserId], [DeletionTime], [AuthenticationSource], [UserName], [TenantId], [EmailAddress], [Name], [Surname], [Password], [EmailConfirmationCode], [PasswordResetCode], [LockoutEndDateUtc], [AccessFailedCount], [IsLockoutEnabled], [PhoneNumber], [IsPhoneNumberConfirmed], [SecurityStamp], [IsTwoFactorEnabled], [IsEmailConfirmed], [IsActive], [NormalizedUserName], [NormalizedEmailAddress], [ConcurrencyStamp]) VALUES (4, CAST(N'2025-05-06T21:07:15.1226045' AS DateTime2), NULL, NULL, NULL, 0, NULL, NULL, NULL, N'01014267914', 1, N'Mohamed Abdelmonem@LMS.com', N'Mohamed Abdelmonem', N'Mohamed Abdelmonem', N'AQAAAAIAAYagAAAAEL6dx7AHCWrkNSLkvWMqq7zihr5lUxdjpuywZFgR7KmnoEkUM3HEHTQDbQFHU9/L5w==', NULL, NULL, NULL, 0, 0, NULL, 0, N'dd788def-0ec1-8e59-12f6-3a19b8f4a8b2', 0, 1, 1, N'01014267914', N'MOHAMED ABDELMONEM@LMS.COM', N'f1536976-4731-42dd-b433-bcb1b2a5a017')
GO
INSERT [dbo].[AbpUsers] ([Id], [CreationTime], [CreatorUserId], [LastModificationTime], [LastModifierUserId], [IsDeleted], [DeleterUserId], [DeletionTime], [AuthenticationSource], [UserName], [TenantId], [EmailAddress], [Name], [Surname], [Password], [EmailConfirmationCode], [PasswordResetCode], [LockoutEndDateUtc], [AccessFailedCount], [IsLockoutEnabled], [PhoneNumber], [IsPhoneNumberConfirmed], [SecurityStamp], [IsTwoFactorEnabled], [IsEmailConfirmed], [IsActive], [NormalizedUserName], [NormalizedEmailAddress], [ConcurrencyStamp]) VALUES (5, CAST(N'2025-05-06T21:07:15.2757352' AS DateTime2), NULL, NULL, NULL, 0, NULL, NULL, NULL, N'01234267685', 1, N'Ehab Osama@LMS.com', N'Ehab Osama', N'Ehab Osama', N'AQAAAAIAAYagAAAAEIZykvuJEJ1E9Jn/5q/hM1G7h2Zl+8+Lj3jXpP4Qv0dReDjo939uVsrIT6R9bneUHg==', NULL, NULL, NULL, 0, 0, NULL, 0, N'0087e332-deb9-8a4c-949b-3a19b8f4a94b', 0, 1, 1, N'01234267685', N'EHAB OSAMA@LMS.COM', N'b5901a90-79e6-47a9-9f2c-29d496325e32')
GO
SET IDENTITY_INSERT [dbo].[AbpUsers] OFF
GO
SET IDENTITY_INSERT [dbo].[BusFeePlans] ON 
GO
INSERT [dbo].[BusFeePlans] ([Id], [Line], [ExpectedTotalAmount], [FullAmountWith5PercentDiscount], [FullAmountDueDate]) VALUES (1, N'Line1', CAST(9300.00 AS Decimal(18, 2)), CAST(8835.00 AS Decimal(18, 2)), CAST(N'2025-06-01T00:00:00.0000000' AS DateTime2))
GO
INSERT [dbo].[BusFeePlans] ([Id], [Line], [ExpectedTotalAmount], [FullAmountWith5PercentDiscount], [FullAmountDueDate]) VALUES (2, N'Line2', CAST(9800.00 AS Decimal(18, 2)), CAST(9310.00 AS Decimal(18, 2)), CAST(N'2025-06-01T00:00:00.0000000' AS DateTime2))
GO
INSERT [dbo].[BusFeePlans] ([Id], [Line], [ExpectedTotalAmount], [FullAmountWith5PercentDiscount], [FullAmountDueDate]) VALUES (3, N'Line3', CAST(10300.00 AS Decimal(18, 2)), CAST(9785.00 AS Decimal(18, 2)), CAST(N'2025-06-01T00:00:00.0000000' AS DateTime2))
GO
INSERT [dbo].[BusFeePlans] ([Id], [Line], [ExpectedTotalAmount], [FullAmountWith5PercentDiscount], [FullAmountDueDate]) VALUES (4, N'Line4', CAST(10800.00 AS Decimal(18, 2)), CAST(10260.00 AS Decimal(18, 2)), CAST(N'2025-06-01T00:00:00.0000000' AS DateTime2))
GO
SET IDENTITY_INSERT [dbo].[BusFeePlans] OFF
GO
SET IDENTITY_INSERT [dbo].[BusInstallments] ON 
GO
INSERT [dbo].[BusInstallments] ([Id], [BusFeePlanId], [Order], [Amount], [DueDate]) VALUES (1, 1, 1, CAST(2800.00 AS Decimal(18, 2)), CAST(N'2025-06-01T00:00:00.0000000' AS DateTime2))
GO
INSERT [dbo].[BusInstallments] ([Id], [BusFeePlanId], [Order], [Amount], [DueDate]) VALUES (2, 1, 2, CAST(2800.00 AS Decimal(18, 2)), CAST(N'2025-08-01T00:00:00.0000000' AS DateTime2))
GO
INSERT [dbo].[BusInstallments] ([Id], [BusFeePlanId], [Order], [Amount], [DueDate]) VALUES (3, 1, 3, CAST(1900.00 AS Decimal(18, 2)), CAST(N'2025-10-01T00:00:00.0000000' AS DateTime2))
GO
INSERT [dbo].[BusInstallments] ([Id], [BusFeePlanId], [Order], [Amount], [DueDate]) VALUES (4, 1, 4, CAST(1800.00 AS Decimal(18, 2)), CAST(N'2025-12-01T00:00:00.0000000' AS DateTime2))
GO
INSERT [dbo].[BusInstallments] ([Id], [BusFeePlanId], [Order], [Amount], [DueDate]) VALUES (5, 2, 1, CAST(2900.00 AS Decimal(18, 2)), CAST(N'2025-06-01T00:00:00.0000000' AS DateTime2))
GO
INSERT [dbo].[BusInstallments] ([Id], [BusFeePlanId], [Order], [Amount], [DueDate]) VALUES (6, 2, 2, CAST(2900.00 AS Decimal(18, 2)), CAST(N'2025-08-01T00:00:00.0000000' AS DateTime2))
GO
INSERT [dbo].[BusInstallments] ([Id], [BusFeePlanId], [Order], [Amount], [DueDate]) VALUES (7, 2, 3, CAST(2000.00 AS Decimal(18, 2)), CAST(N'2025-10-01T00:00:00.0000000' AS DateTime2))
GO
INSERT [dbo].[BusInstallments] ([Id], [BusFeePlanId], [Order], [Amount], [DueDate]) VALUES (8, 2, 4, CAST(2000.00 AS Decimal(18, 2)), CAST(N'2025-12-01T00:00:00.0000000' AS DateTime2))
GO
INSERT [dbo].[BusInstallments] ([Id], [BusFeePlanId], [Order], [Amount], [DueDate]) VALUES (9, 3, 1, CAST(3100.00 AS Decimal(18, 2)), CAST(N'2025-06-01T00:00:00.0000000' AS DateTime2))
GO
INSERT [dbo].[BusInstallments] ([Id], [BusFeePlanId], [Order], [Amount], [DueDate]) VALUES (10, 3, 2, CAST(3100.00 AS Decimal(18, 2)), CAST(N'2025-08-01T00:00:00.0000000' AS DateTime2))
GO
INSERT [dbo].[BusInstallments] ([Id], [BusFeePlanId], [Order], [Amount], [DueDate]) VALUES (11, 3, 3, CAST(2100.00 AS Decimal(18, 2)), CAST(N'2025-10-01T00:00:00.0000000' AS DateTime2))
GO
INSERT [dbo].[BusInstallments] ([Id], [BusFeePlanId], [Order], [Amount], [DueDate]) VALUES (12, 3, 4, CAST(2000.00 AS Decimal(18, 2)), CAST(N'2025-12-01T00:00:00.0000000' AS DateTime2))
GO
INSERT [dbo].[BusInstallments] ([Id], [BusFeePlanId], [Order], [Amount], [DueDate]) VALUES (13, 4, 1, CAST(3200.00 AS Decimal(18, 2)), CAST(N'2025-06-01T00:00:00.0000000' AS DateTime2))
GO
INSERT [dbo].[BusInstallments] ([Id], [BusFeePlanId], [Order], [Amount], [DueDate]) VALUES (14, 4, 2, CAST(3200.00 AS Decimal(18, 2)), CAST(N'2025-08-01T00:00:00.0000000' AS DateTime2))
GO
INSERT [dbo].[BusInstallments] ([Id], [BusFeePlanId], [Order], [Amount], [DueDate]) VALUES (15, 4, 3, CAST(2200.00 AS Decimal(18, 2)), CAST(N'2025-10-01T00:00:00.0000000' AS DateTime2))
GO
INSERT [dbo].[BusInstallments] ([Id], [BusFeePlanId], [Order], [Amount], [DueDate]) VALUES (16, 4, 4, CAST(2200.00 AS Decimal(18, 2)), CAST(N'2025-12-01T00:00:00.0000000' AS DateTime2))
GO
SET IDENTITY_INSERT [dbo].[BusInstallments] OFF
GO
SET IDENTITY_INSERT [dbo].[EducationalFeePlans] ON 
GO
INSERT [dbo].[EducationalFeePlans] ([Id], [Grade], [ExpectedTotalAmount], [FullAmountWith5PercentDiscount], [FullAmountDueDate]) VALUES (1, N'KG 1', CAST(28200.00 AS Decimal(18, 2)), CAST(26790.00 AS Decimal(18, 2)), CAST(N'2025-06-01T00:00:00.0000000' AS DateTime2))
GO
INSERT [dbo].[EducationalFeePlans] ([Id], [Grade], [ExpectedTotalAmount], [FullAmountWith5PercentDiscount], [FullAmountDueDate]) VALUES (2, N'KG 2', CAST(28300.00 AS Decimal(18, 2)), CAST(26885.00 AS Decimal(18, 2)), CAST(N'2025-06-01T00:00:00.0000000' AS DateTime2))
GO
INSERT [dbo].[EducationalFeePlans] ([Id], [Grade], [ExpectedTotalAmount], [FullAmountWith5PercentDiscount], [FullAmountDueDate]) VALUES (3, N'Prim 1', CAST(29700.00 AS Decimal(18, 2)), CAST(28215.00 AS Decimal(18, 2)), CAST(N'2025-06-01T00:00:00.0000000' AS DateTime2))
GO
INSERT [dbo].[EducationalFeePlans] ([Id], [Grade], [ExpectedTotalAmount], [FullAmountWith5PercentDiscount], [FullAmountDueDate]) VALUES (4, N'Prim 2', CAST(29900.00 AS Decimal(18, 2)), CAST(28405.00 AS Decimal(18, 2)), CAST(N'2025-06-01T00:00:00.0000000' AS DateTime2))
GO
INSERT [dbo].[EducationalFeePlans] ([Id], [Grade], [ExpectedTotalAmount], [FullAmountWith5PercentDiscount], [FullAmountDueDate]) VALUES (5, N'Prim 3', CAST(31000.00 AS Decimal(18, 2)), CAST(29450.00 AS Decimal(18, 2)), CAST(N'2025-06-01T00:00:00.0000000' AS DateTime2))
GO
INSERT [dbo].[EducationalFeePlans] ([Id], [Grade], [ExpectedTotalAmount], [FullAmountWith5PercentDiscount], [FullAmountDueDate]) VALUES (6, N'Prim 4', CAST(29800.00 AS Decimal(18, 2)), CAST(28310.00 AS Decimal(18, 2)), CAST(N'2025-06-01T00:00:00.0000000' AS DateTime2))
GO
INSERT [dbo].[EducationalFeePlans] ([Id], [Grade], [ExpectedTotalAmount], [FullAmountWith5PercentDiscount], [FullAmountDueDate]) VALUES (7, N'Prim 5', CAST(31600.00 AS Decimal(18, 2)), CAST(30020.00 AS Decimal(18, 2)), CAST(N'2025-06-01T00:00:00.0000000' AS DateTime2))
GO
INSERT [dbo].[EducationalFeePlans] ([Id], [Grade], [ExpectedTotalAmount], [FullAmountWith5PercentDiscount], [FullAmountDueDate]) VALUES (8, N'Prim 6', CAST(29800.00 AS Decimal(18, 2)), CAST(28310.00 AS Decimal(18, 2)), CAST(N'2025-06-01T00:00:00.0000000' AS DateTime2))
GO
INSERT [dbo].[EducationalFeePlans] ([Id], [Grade], [ExpectedTotalAmount], [FullAmountWith5PercentDiscount], [FullAmountDueDate]) VALUES (9, N'Prep 1', CAST(33800.00 AS Decimal(18, 2)), CAST(32110.00 AS Decimal(18, 2)), CAST(N'2025-06-01T00:00:00.0000000' AS DateTime2))
GO
INSERT [dbo].[EducationalFeePlans] ([Id], [Grade], [ExpectedTotalAmount], [FullAmountWith5PercentDiscount], [FullAmountDueDate]) VALUES (10, N'Prep 2', CAST(32400.00 AS Decimal(18, 2)), CAST(30780.00 AS Decimal(18, 2)), CAST(N'2025-06-01T00:00:00.0000000' AS DateTime2))
GO
INSERT [dbo].[EducationalFeePlans] ([Id], [Grade], [ExpectedTotalAmount], [FullAmountWith5PercentDiscount], [FullAmountDueDate]) VALUES (11, N'Prep 3', CAST(32300.00 AS Decimal(18, 2)), CAST(30685.00 AS Decimal(18, 2)), CAST(N'2025-06-01T00:00:00.0000000' AS DateTime2))
GO
INSERT [dbo].[EducationalFeePlans] ([Id], [Grade], [ExpectedTotalAmount], [FullAmountWith5PercentDiscount], [FullAmountDueDate]) VALUES (12, N'Sec 1', CAST(34600.00 AS Decimal(18, 2)), CAST(32870.00 AS Decimal(18, 2)), CAST(N'2025-06-01T00:00:00.0000000' AS DateTime2))
GO
INSERT [dbo].[EducationalFeePlans] ([Id], [Grade], [ExpectedTotalAmount], [FullAmountWith5PercentDiscount], [FullAmountDueDate]) VALUES (13, N'Sec 2', CAST(34400.00 AS Decimal(18, 2)), CAST(32680.00 AS Decimal(18, 2)), CAST(N'2025-06-01T00:00:00.0000000' AS DateTime2))
GO
INSERT [dbo].[EducationalFeePlans] ([Id], [Grade], [ExpectedTotalAmount], [FullAmountWith5PercentDiscount], [FullAmountDueDate]) VALUES (14, N'Sec 3', CAST(33400.00 AS Decimal(18, 2)), CAST(31730.00 AS Decimal(18, 2)), CAST(N'2025-06-01T00:00:00.0000000' AS DateTime2))
GO
SET IDENTITY_INSERT [dbo].[EducationalFeePlans] OFF
GO
SET IDENTITY_INSERT [dbo].[EducationalInstallments] ON 
GO
INSERT [dbo].[EducationalInstallments] ([Id], [EducationalFeePlanId], [Order], [Amount], [DueDate]) VALUES (1, 1, 1, CAST(8500.00 AS Decimal(18, 2)), CAST(N'2025-06-01T00:00:00.0000000' AS DateTime2))
GO
INSERT [dbo].[EducationalInstallments] ([Id], [EducationalFeePlanId], [Order], [Amount], [DueDate]) VALUES (2, 1, 2, CAST(8500.00 AS Decimal(18, 2)), CAST(N'2025-08-01T00:00:00.0000000' AS DateTime2))
GO
INSERT [dbo].[EducationalInstallments] ([Id], [EducationalFeePlanId], [Order], [Amount], [DueDate]) VALUES (3, 1, 3, CAST(5600.00 AS Decimal(18, 2)), CAST(N'2025-10-01T00:00:00.0000000' AS DateTime2))
GO
INSERT [dbo].[EducationalInstallments] ([Id], [EducationalFeePlanId], [Order], [Amount], [DueDate]) VALUES (4, 1, 4, CAST(5600.00 AS Decimal(18, 2)), CAST(N'2025-12-01T00:00:00.0000000' AS DateTime2))
GO
INSERT [dbo].[EducationalInstallments] ([Id], [EducationalFeePlanId], [Order], [Amount], [DueDate]) VALUES (5, 2, 1, CAST(8500.00 AS Decimal(18, 2)), CAST(N'2025-06-01T00:00:00.0000000' AS DateTime2))
GO
INSERT [dbo].[EducationalInstallments] ([Id], [EducationalFeePlanId], [Order], [Amount], [DueDate]) VALUES (6, 2, 2, CAST(8500.00 AS Decimal(18, 2)), CAST(N'2025-08-01T00:00:00.0000000' AS DateTime2))
GO
INSERT [dbo].[EducationalInstallments] ([Id], [EducationalFeePlanId], [Order], [Amount], [DueDate]) VALUES (7, 2, 3, CAST(5700.00 AS Decimal(18, 2)), CAST(N'2025-10-01T00:00:00.0000000' AS DateTime2))
GO
INSERT [dbo].[EducationalInstallments] ([Id], [EducationalFeePlanId], [Order], [Amount], [DueDate]) VALUES (8, 2, 4, CAST(5600.00 AS Decimal(18, 2)), CAST(N'2025-12-01T00:00:00.0000000' AS DateTime2))
GO
INSERT [dbo].[EducationalInstallments] ([Id], [EducationalFeePlanId], [Order], [Amount], [DueDate]) VALUES (9, 3, 1, CAST(8900.00 AS Decimal(18, 2)), CAST(N'2025-06-01T00:00:00.0000000' AS DateTime2))
GO
INSERT [dbo].[EducationalInstallments] ([Id], [EducationalFeePlanId], [Order], [Amount], [DueDate]) VALUES (10, 3, 2, CAST(8900.00 AS Decimal(18, 2)), CAST(N'2025-08-01T00:00:00.0000000' AS DateTime2))
GO
INSERT [dbo].[EducationalInstallments] ([Id], [EducationalFeePlanId], [Order], [Amount], [DueDate]) VALUES (11, 3, 3, CAST(6000.00 AS Decimal(18, 2)), CAST(N'2025-10-01T00:00:00.0000000' AS DateTime2))
GO
INSERT [dbo].[EducationalInstallments] ([Id], [EducationalFeePlanId], [Order], [Amount], [DueDate]) VALUES (12, 3, 4, CAST(5900.00 AS Decimal(18, 2)), CAST(N'2025-12-01T00:00:00.0000000' AS DateTime2))
GO
INSERT [dbo].[EducationalInstallments] ([Id], [EducationalFeePlanId], [Order], [Amount], [DueDate]) VALUES (13, 4, 1, CAST(9000.00 AS Decimal(18, 2)), CAST(N'2025-06-01T00:00:00.0000000' AS DateTime2))
GO
INSERT [dbo].[EducationalInstallments] ([Id], [EducationalFeePlanId], [Order], [Amount], [DueDate]) VALUES (14, 4, 2, CAST(9000.00 AS Decimal(18, 2)), CAST(N'2025-08-01T00:00:00.0000000' AS DateTime2))
GO
INSERT [dbo].[EducationalInstallments] ([Id], [EducationalFeePlanId], [Order], [Amount], [DueDate]) VALUES (15, 4, 3, CAST(6000.00 AS Decimal(18, 2)), CAST(N'2025-10-01T00:00:00.0000000' AS DateTime2))
GO
INSERT [dbo].[EducationalInstallments] ([Id], [EducationalFeePlanId], [Order], [Amount], [DueDate]) VALUES (16, 4, 4, CAST(5900.00 AS Decimal(18, 2)), CAST(N'2025-12-01T00:00:00.0000000' AS DateTime2))
GO
INSERT [dbo].[EducationalInstallments] ([Id], [EducationalFeePlanId], [Order], [Amount], [DueDate]) VALUES (17, 5, 1, CAST(9300.00 AS Decimal(18, 2)), CAST(N'2025-06-01T00:00:00.0000000' AS DateTime2))
GO
INSERT [dbo].[EducationalInstallments] ([Id], [EducationalFeePlanId], [Order], [Amount], [DueDate]) VALUES (18, 5, 2, CAST(9300.00 AS Decimal(18, 2)), CAST(N'2025-08-01T00:00:00.0000000' AS DateTime2))
GO
INSERT [dbo].[EducationalInstallments] ([Id], [EducationalFeePlanId], [Order], [Amount], [DueDate]) VALUES (19, 5, 3, CAST(6200.00 AS Decimal(18, 2)), CAST(N'2025-10-01T00:00:00.0000000' AS DateTime2))
GO
INSERT [dbo].[EducationalInstallments] ([Id], [EducationalFeePlanId], [Order], [Amount], [DueDate]) VALUES (20, 5, 4, CAST(6200.00 AS Decimal(18, 2)), CAST(N'2025-12-01T00:00:00.0000000' AS DateTime2))
GO
INSERT [dbo].[EducationalInstallments] ([Id], [EducationalFeePlanId], [Order], [Amount], [DueDate]) VALUES (21, 6, 1, CAST(9000.00 AS Decimal(18, 2)), CAST(N'2025-06-01T00:00:00.0000000' AS DateTime2))
GO
INSERT [dbo].[EducationalInstallments] ([Id], [EducationalFeePlanId], [Order], [Amount], [DueDate]) VALUES (22, 6, 2, CAST(9000.00 AS Decimal(18, 2)), CAST(N'2025-08-01T00:00:00.0000000' AS DateTime2))
GO
INSERT [dbo].[EducationalInstallments] ([Id], [EducationalFeePlanId], [Order], [Amount], [DueDate]) VALUES (23, 6, 3, CAST(5900.00 AS Decimal(18, 2)), CAST(N'2025-10-01T00:00:00.0000000' AS DateTime2))
GO
INSERT [dbo].[EducationalInstallments] ([Id], [EducationalFeePlanId], [Order], [Amount], [DueDate]) VALUES (24, 6, 4, CAST(5900.00 AS Decimal(18, 2)), CAST(N'2025-12-01T00:00:00.0000000' AS DateTime2))
GO
INSERT [dbo].[EducationalInstallments] ([Id], [EducationalFeePlanId], [Order], [Amount], [DueDate]) VALUES (25, 7, 1, CAST(9500.00 AS Decimal(18, 2)), CAST(N'2025-06-01T00:00:00.0000000' AS DateTime2))
GO
INSERT [dbo].[EducationalInstallments] ([Id], [EducationalFeePlanId], [Order], [Amount], [DueDate]) VALUES (26, 7, 2, CAST(9500.00 AS Decimal(18, 2)), CAST(N'2025-08-01T00:00:00.0000000' AS DateTime2))
GO
INSERT [dbo].[EducationalInstallments] ([Id], [EducationalFeePlanId], [Order], [Amount], [DueDate]) VALUES (27, 7, 3, CAST(6300.00 AS Decimal(18, 2)), CAST(N'2025-10-01T00:00:00.0000000' AS DateTime2))
GO
INSERT [dbo].[EducationalInstallments] ([Id], [EducationalFeePlanId], [Order], [Amount], [DueDate]) VALUES (28, 7, 4, CAST(6300.00 AS Decimal(18, 2)), CAST(N'2025-12-01T00:00:00.0000000' AS DateTime2))
GO
INSERT [dbo].[EducationalInstallments] ([Id], [EducationalFeePlanId], [Order], [Amount], [DueDate]) VALUES (29, 8, 1, CAST(9000.00 AS Decimal(18, 2)), CAST(N'2025-06-01T00:00:00.0000000' AS DateTime2))
GO
INSERT [dbo].[EducationalInstallments] ([Id], [EducationalFeePlanId], [Order], [Amount], [DueDate]) VALUES (30, 8, 2, CAST(9000.00 AS Decimal(18, 2)), CAST(N'2025-08-01T00:00:00.0000000' AS DateTime2))
GO
INSERT [dbo].[EducationalInstallments] ([Id], [EducationalFeePlanId], [Order], [Amount], [DueDate]) VALUES (31, 8, 3, CAST(6000.00 AS Decimal(18, 2)), CAST(N'2025-10-01T00:00:00.0000000' AS DateTime2))
GO
INSERT [dbo].[EducationalInstallments] ([Id], [EducationalFeePlanId], [Order], [Amount], [DueDate]) VALUES (32, 8, 4, CAST(5800.00 AS Decimal(18, 2)), CAST(N'2025-12-01T00:00:00.0000000' AS DateTime2))
GO
INSERT [dbo].[EducationalInstallments] ([Id], [EducationalFeePlanId], [Order], [Amount], [DueDate]) VALUES (33, 9, 1, CAST(10200.00 AS Decimal(18, 2)), CAST(N'2025-06-01T00:00:00.0000000' AS DateTime2))
GO
INSERT [dbo].[EducationalInstallments] ([Id], [EducationalFeePlanId], [Order], [Amount], [DueDate]) VALUES (34, 9, 2, CAST(10200.00 AS Decimal(18, 2)), CAST(N'2025-08-01T00:00:00.0000000' AS DateTime2))
GO
INSERT [dbo].[EducationalInstallments] ([Id], [EducationalFeePlanId], [Order], [Amount], [DueDate]) VALUES (35, 9, 3, CAST(6700.00 AS Decimal(18, 2)), CAST(N'2025-10-01T00:00:00.0000000' AS DateTime2))
GO
INSERT [dbo].[EducationalInstallments] ([Id], [EducationalFeePlanId], [Order], [Amount], [DueDate]) VALUES (36, 9, 4, CAST(6700.00 AS Decimal(18, 2)), CAST(N'2025-12-01T00:00:00.0000000' AS DateTime2))
GO
INSERT [dbo].[EducationalInstallments] ([Id], [EducationalFeePlanId], [Order], [Amount], [DueDate]) VALUES (37, 10, 1, CAST(9700.00 AS Decimal(18, 2)), CAST(N'2025-06-01T00:00:00.0000000' AS DateTime2))
GO
INSERT [dbo].[EducationalInstallments] ([Id], [EducationalFeePlanId], [Order], [Amount], [DueDate]) VALUES (38, 10, 2, CAST(9700.00 AS Decimal(18, 2)), CAST(N'2025-08-01T00:00:00.0000000' AS DateTime2))
GO
INSERT [dbo].[EducationalInstallments] ([Id], [EducationalFeePlanId], [Order], [Amount], [DueDate]) VALUES (39, 10, 3, CAST(6500.00 AS Decimal(18, 2)), CAST(N'2025-10-01T00:00:00.0000000' AS DateTime2))
GO
INSERT [dbo].[EducationalInstallments] ([Id], [EducationalFeePlanId], [Order], [Amount], [DueDate]) VALUES (40, 10, 4, CAST(6500.00 AS Decimal(18, 2)), CAST(N'2025-12-01T00:00:00.0000000' AS DateTime2))
GO
INSERT [dbo].[EducationalInstallments] ([Id], [EducationalFeePlanId], [Order], [Amount], [DueDate]) VALUES (41, 11, 1, CAST(9700.00 AS Decimal(18, 2)), CAST(N'2025-06-01T00:00:00.0000000' AS DateTime2))
GO
INSERT [dbo].[EducationalInstallments] ([Id], [EducationalFeePlanId], [Order], [Amount], [DueDate]) VALUES (42, 11, 2, CAST(9700.00 AS Decimal(18, 2)), CAST(N'2025-08-01T00:00:00.0000000' AS DateTime2))
GO
INSERT [dbo].[EducationalInstallments] ([Id], [EducationalFeePlanId], [Order], [Amount], [DueDate]) VALUES (43, 11, 3, CAST(6500.00 AS Decimal(18, 2)), CAST(N'2025-10-01T00:00:00.0000000' AS DateTime2))
GO
INSERT [dbo].[EducationalInstallments] ([Id], [EducationalFeePlanId], [Order], [Amount], [DueDate]) VALUES (44, 11, 4, CAST(6400.00 AS Decimal(18, 2)), CAST(N'2025-12-01T00:00:00.0000000' AS DateTime2))
GO
INSERT [dbo].[EducationalInstallments] ([Id], [EducationalFeePlanId], [Order], [Amount], [DueDate]) VALUES (45, 12, 1, CAST(10400.00 AS Decimal(18, 2)), CAST(N'2025-06-01T00:00:00.0000000' AS DateTime2))
GO
INSERT [dbo].[EducationalInstallments] ([Id], [EducationalFeePlanId], [Order], [Amount], [DueDate]) VALUES (46, 12, 2, CAST(10400.00 AS Decimal(18, 2)), CAST(N'2025-08-01T00:00:00.0000000' AS DateTime2))
GO
INSERT [dbo].[EducationalInstallments] ([Id], [EducationalFeePlanId], [Order], [Amount], [DueDate]) VALUES (47, 12, 3, CAST(7000.00 AS Decimal(18, 2)), CAST(N'2025-10-01T00:00:00.0000000' AS DateTime2))
GO
INSERT [dbo].[EducationalInstallments] ([Id], [EducationalFeePlanId], [Order], [Amount], [DueDate]) VALUES (48, 12, 4, CAST(6800.00 AS Decimal(18, 2)), CAST(N'2025-12-01T00:00:00.0000000' AS DateTime2))
GO
INSERT [dbo].[EducationalInstallments] ([Id], [EducationalFeePlanId], [Order], [Amount], [DueDate]) VALUES (49, 13, 1, CAST(10400.00 AS Decimal(18, 2)), CAST(N'2025-06-01T00:00:00.0000000' AS DateTime2))
GO
INSERT [dbo].[EducationalInstallments] ([Id], [EducationalFeePlanId], [Order], [Amount], [DueDate]) VALUES (50, 13, 2, CAST(10400.00 AS Decimal(18, 2)), CAST(N'2025-08-01T00:00:00.0000000' AS DateTime2))
GO
INSERT [dbo].[EducationalInstallments] ([Id], [EducationalFeePlanId], [Order], [Amount], [DueDate]) VALUES (51, 13, 3, CAST(6880.00 AS Decimal(18, 2)), CAST(N'2025-10-01T00:00:00.0000000' AS DateTime2))
GO
INSERT [dbo].[EducationalInstallments] ([Id], [EducationalFeePlanId], [Order], [Amount], [DueDate]) VALUES (52, 13, 4, CAST(6720.00 AS Decimal(18, 2)), CAST(N'2025-12-01T00:00:00.0000000' AS DateTime2))
GO
INSERT [dbo].[EducationalInstallments] ([Id], [EducationalFeePlanId], [Order], [Amount], [DueDate]) VALUES (53, 14, 1, CAST(10000.00 AS Decimal(18, 2)), CAST(N'2025-06-01T00:00:00.0000000' AS DateTime2))
GO
INSERT [dbo].[EducationalInstallments] ([Id], [EducationalFeePlanId], [Order], [Amount], [DueDate]) VALUES (54, 14, 2, CAST(10000.00 AS Decimal(18, 2)), CAST(N'2025-08-01T00:00:00.0000000' AS DateTime2))
GO
INSERT [dbo].[EducationalInstallments] ([Id], [EducationalFeePlanId], [Order], [Amount], [DueDate]) VALUES (55, 14, 3, CAST(6800.00 AS Decimal(18, 2)), CAST(N'2025-10-01T00:00:00.0000000' AS DateTime2))
GO
INSERT [dbo].[EducationalInstallments] ([Id], [EducationalFeePlanId], [Order], [Amount], [DueDate]) VALUES (56, 14, 4, CAST(6600.00 AS Decimal(18, 2)), CAST(N'2025-12-01T00:00:00.0000000' AS DateTime2))
GO
SET IDENTITY_INSERT [dbo].[EducationalInstallments] OFF
GO
SET IDENTITY_INSERT [dbo].[StudentBusSubscriptions] ON 
GO
INSERT [dbo].[StudentBusSubscriptions] ([Id], [StudentId], [BusFeePlanId], [SubscriptionDate], [Status], [Notes]) VALUES (1, 2, 1, CAST(N'2025-05-06T23:48:41.2382850' AS DateTime2), 0, NULL)
GO
INSERT [dbo].[StudentBusSubscriptions] ([Id], [StudentId], [BusFeePlanId], [SubscriptionDate], [Status], [Notes]) VALUES (2, 3, 3, CAST(N'2025-05-08T15:48:29.4384888' AS DateTime2), 0, NULL)
GO
SET IDENTITY_INSERT [dbo].[StudentBusSubscriptions] OFF
GO
SET IDENTITY_INSERT [dbo].[StudentEducationalPayments] ON 
GO
INSERT [dbo].[StudentEducationalPayments] ([Id], [StudentId], [EducationalInstallmentId], [IsFullPayment], [PaymentDate], [AmountPaid], [PaymentStatus], [PaymentStatusLastUpdate], [TransactionId], [InvoiceNumber]) VALUES (2, 1, NULL, 1, CAST(N'2025-05-06T22:22:35.7950000' AS DateTime2), CAST(28405.00 AS Decimal(18, 2)), 1, CAST(N'0001-01-01T00:00:00.0000000' AS DateTime2), NULL, NULL)
GO
INSERT [dbo].[StudentEducationalPayments] ([Id], [StudentId], [EducationalInstallmentId], [IsFullPayment], [PaymentDate], [AmountPaid], [PaymentStatus], [PaymentStatusLastUpdate], [TransactionId], [InvoiceNumber]) VALUES (5, 2, 17, 0, CAST(N'2025-05-06T22:34:51.0920000' AS DateTime2), CAST(9300.00 AS Decimal(18, 2)), 1, CAST(N'0001-01-01T00:00:00.0000000' AS DateTime2), NULL, NULL)
GO
INSERT [dbo].[StudentEducationalPayments] ([Id], [StudentId], [EducationalInstallmentId], [IsFullPayment], [PaymentDate], [AmountPaid], [PaymentStatus], [PaymentStatusLastUpdate], [TransactionId], [InvoiceNumber]) VALUES (6, 2, 18, 0, CAST(N'2025-05-06T22:34:51.0920000' AS DateTime2), CAST(9300.00 AS Decimal(18, 2)), 1, CAST(N'0001-01-01T00:00:00.0000000' AS DateTime2), NULL, NULL)
GO
INSERT [dbo].[StudentEducationalPayments] ([Id], [StudentId], [EducationalInstallmentId], [IsFullPayment], [PaymentDate], [AmountPaid], [PaymentStatus], [PaymentStatusLastUpdate], [TransactionId], [InvoiceNumber]) VALUES (7, 3, 21, 0, CAST(N'2025-05-08T15:47:40.5920000' AS DateTime2), CAST(9000.00 AS Decimal(18, 2)), 1, CAST(N'0001-01-01T00:00:00.0000000' AS DateTime2), NULL, NULL)
GO
INSERT [dbo].[StudentEducationalPayments] ([Id], [StudentId], [EducationalInstallmentId], [IsFullPayment], [PaymentDate], [AmountPaid], [PaymentStatus], [PaymentStatusLastUpdate], [TransactionId], [InvoiceNumber]) VALUES (8, 3, 22, 0, CAST(N'2025-05-09T15:10:29.0650000' AS DateTime2), CAST(9000.00 AS Decimal(18, 2)), 1, CAST(N'0001-01-01T00:00:00.0000000' AS DateTime2), NULL, NULL)
GO
SET IDENTITY_INSERT [dbo].[StudentEducationalPayments] OFF
GO
SET IDENTITY_INSERT [dbo].[Students] ON 
GO
INSERT [dbo].[Students] ([Id], [StudentId], [Name], [Grade], [MobileNumber], [Status], [PreviousAmount]) VALUES (1, N'125', N'Ahmed Ali', N'Prim 2', N'01545646456', N'New Common', CAST(450.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[Students] ([Id], [StudentId], [Name], [Grade], [MobileNumber], [Status], [PreviousAmount]) VALUES (2, N'436', N'Mohamed Abdelmonem', N'Prim 3', N'01014267914', N'New Common', CAST(1300.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[Students] ([Id], [StudentId], [Name], [Grade], [MobileNumber], [Status], [PreviousAmount]) VALUES (3, N'1127', N'Ehab Osama', N'Prim 4', N'01234267685', N'New Common', CAST(0.00 AS Decimal(18, 2)))
GO
SET IDENTITY_INSERT [dbo].[Students] OFF
GO
/****** Object:  Index [IX_AbpAuditLogs_TenantId_ExecutionDuration]    Script Date: 5/9/2025 3:32:24 PM ******/
CREATE NONCLUSTERED INDEX [IX_AbpAuditLogs_TenantId_ExecutionDuration] ON [dbo].[AbpAuditLogs]
(
	[TenantId] ASC,
	[ExecutionDuration] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_AbpAuditLogs_TenantId_ExecutionTime]    Script Date: 5/9/2025 3:32:24 PM ******/
CREATE NONCLUSTERED INDEX [IX_AbpAuditLogs_TenantId_ExecutionTime] ON [dbo].[AbpAuditLogs]
(
	[TenantId] ASC,
	[ExecutionTime] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_AbpAuditLogs_TenantId_UserId]    Script Date: 5/9/2025 3:32:24 PM ******/
CREATE NONCLUSTERED INDEX [IX_AbpAuditLogs_TenantId_UserId] ON [dbo].[AbpAuditLogs]
(
	[TenantId] ASC,
	[UserId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_AbpBackgroundJobs_IsAbandoned_NextTryTime]    Script Date: 5/9/2025 3:32:24 PM ******/
CREATE NONCLUSTERED INDEX [IX_AbpBackgroundJobs_IsAbandoned_NextTryTime] ON [dbo].[AbpBackgroundJobs]
(
	[IsAbandoned] ASC,
	[NextTryTime] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_AbpDynamicEntityProperties_DynamicPropertyId]    Script Date: 5/9/2025 3:32:24 PM ******/
CREATE NONCLUSTERED INDEX [IX_AbpDynamicEntityProperties_DynamicPropertyId] ON [dbo].[AbpDynamicEntityProperties]
(
	[DynamicPropertyId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IX_AbpDynamicEntityProperties_EntityFullName_DynamicPropertyId_TenantId]    Script Date: 5/9/2025 3:32:24 PM ******/
CREATE UNIQUE NONCLUSTERED INDEX [IX_AbpDynamicEntityProperties_EntityFullName_DynamicPropertyId_TenantId] ON [dbo].[AbpDynamicEntityProperties]
(
	[EntityFullName] ASC,
	[DynamicPropertyId] ASC,
	[TenantId] ASC
)
WHERE ([EntityFullName] IS NOT NULL AND [TenantId] IS NOT NULL)
WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_AbpDynamicEntityPropertyValues_DynamicEntityPropertyId]    Script Date: 5/9/2025 3:32:24 PM ******/
CREATE NONCLUSTERED INDEX [IX_AbpDynamicEntityPropertyValues_DynamicEntityPropertyId] ON [dbo].[AbpDynamicEntityPropertyValues]
(
	[DynamicEntityPropertyId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IX_AbpDynamicProperties_PropertyName_TenantId]    Script Date: 5/9/2025 3:32:24 PM ******/
CREATE UNIQUE NONCLUSTERED INDEX [IX_AbpDynamicProperties_PropertyName_TenantId] ON [dbo].[AbpDynamicProperties]
(
	[PropertyName] ASC,
	[TenantId] ASC
)
WHERE ([PropertyName] IS NOT NULL AND [TenantId] IS NOT NULL)
WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_AbpDynamicPropertyValues_DynamicPropertyId]    Script Date: 5/9/2025 3:32:24 PM ******/
CREATE NONCLUSTERED INDEX [IX_AbpDynamicPropertyValues_DynamicPropertyId] ON [dbo].[AbpDynamicPropertyValues]
(
	[DynamicPropertyId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_AbpEntityChanges_EntityChangeSetId]    Script Date: 5/9/2025 3:32:24 PM ******/
CREATE NONCLUSTERED INDEX [IX_AbpEntityChanges_EntityChangeSetId] ON [dbo].[AbpEntityChanges]
(
	[EntityChangeSetId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IX_AbpEntityChanges_EntityTypeFullName_EntityId]    Script Date: 5/9/2025 3:32:24 PM ******/
CREATE NONCLUSTERED INDEX [IX_AbpEntityChanges_EntityTypeFullName_EntityId] ON [dbo].[AbpEntityChanges]
(
	[EntityTypeFullName] ASC,
	[EntityId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_AbpEntityChangeSets_TenantId_CreationTime]    Script Date: 5/9/2025 3:32:24 PM ******/
CREATE NONCLUSTERED INDEX [IX_AbpEntityChangeSets_TenantId_CreationTime] ON [dbo].[AbpEntityChangeSets]
(
	[TenantId] ASC,
	[CreationTime] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IX_AbpEntityChangeSets_TenantId_Reason]    Script Date: 5/9/2025 3:32:24 PM ******/
CREATE NONCLUSTERED INDEX [IX_AbpEntityChangeSets_TenantId_Reason] ON [dbo].[AbpEntityChangeSets]
(
	[TenantId] ASC,
	[Reason] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_AbpEntityChangeSets_TenantId_UserId]    Script Date: 5/9/2025 3:32:24 PM ******/
CREATE NONCLUSTERED INDEX [IX_AbpEntityChangeSets_TenantId_UserId] ON [dbo].[AbpEntityChangeSets]
(
	[TenantId] ASC,
	[UserId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_AbpEntityPropertyChanges_EntityChangeId]    Script Date: 5/9/2025 3:32:24 PM ******/
CREATE NONCLUSTERED INDEX [IX_AbpEntityPropertyChanges_EntityChangeId] ON [dbo].[AbpEntityPropertyChanges]
(
	[EntityChangeId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IX_AbpFeatures_EditionId_Name]    Script Date: 5/9/2025 3:32:24 PM ******/
CREATE NONCLUSTERED INDEX [IX_AbpFeatures_EditionId_Name] ON [dbo].[AbpFeatures]
(
	[EditionId] ASC,
	[Name] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IX_AbpFeatures_TenantId_Name]    Script Date: 5/9/2025 3:32:24 PM ******/
CREATE NONCLUSTERED INDEX [IX_AbpFeatures_TenantId_Name] ON [dbo].[AbpFeatures]
(
	[TenantId] ASC,
	[Name] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IX_AbpLanguages_TenantId_Name]    Script Date: 5/9/2025 3:32:24 PM ******/
CREATE NONCLUSTERED INDEX [IX_AbpLanguages_TenantId_Name] ON [dbo].[AbpLanguages]
(
	[TenantId] ASC,
	[Name] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IX_AbpLanguageTexts_TenantId_Source_LanguageName_Key]    Script Date: 5/9/2025 3:32:24 PM ******/
CREATE NONCLUSTERED INDEX [IX_AbpLanguageTexts_TenantId_Source_LanguageName_Key] ON [dbo].[AbpLanguageTexts]
(
	[TenantId] ASC,
	[Source] ASC,
	[LanguageName] ASC,
	[Key] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IX_AbpNotificationSubscriptions_NotificationName_EntityTypeName_EntityId_UserId]    Script Date: 5/9/2025 3:32:24 PM ******/
CREATE NONCLUSTERED INDEX [IX_AbpNotificationSubscriptions_NotificationName_EntityTypeName_EntityId_UserId] ON [dbo].[AbpNotificationSubscriptions]
(
	[NotificationName] ASC,
	[EntityTypeName] ASC,
	[EntityId] ASC,
	[UserId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IX_AbpNotificationSubscriptions_TenantId_NotificationName_EntityTypeName_EntityId_UserId]    Script Date: 5/9/2025 3:32:24 PM ******/
CREATE NONCLUSTERED INDEX [IX_AbpNotificationSubscriptions_TenantId_NotificationName_EntityTypeName_EntityId_UserId] ON [dbo].[AbpNotificationSubscriptions]
(
	[TenantId] ASC,
	[NotificationName] ASC,
	[EntityTypeName] ASC,
	[EntityId] ASC,
	[UserId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_AbpOrganizationUnitRoles_TenantId_OrganizationUnitId]    Script Date: 5/9/2025 3:32:24 PM ******/
CREATE NONCLUSTERED INDEX [IX_AbpOrganizationUnitRoles_TenantId_OrganizationUnitId] ON [dbo].[AbpOrganizationUnitRoles]
(
	[TenantId] ASC,
	[OrganizationUnitId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_AbpOrganizationUnitRoles_TenantId_RoleId]    Script Date: 5/9/2025 3:32:24 PM ******/
CREATE NONCLUSTERED INDEX [IX_AbpOrganizationUnitRoles_TenantId_RoleId] ON [dbo].[AbpOrganizationUnitRoles]
(
	[TenantId] ASC,
	[RoleId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_AbpOrganizationUnits_ParentId]    Script Date: 5/9/2025 3:32:24 PM ******/
CREATE NONCLUSTERED INDEX [IX_AbpOrganizationUnits_ParentId] ON [dbo].[AbpOrganizationUnits]
(
	[ParentId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IX_AbpOrganizationUnits_TenantId_Code]    Script Date: 5/9/2025 3:32:24 PM ******/
CREATE NONCLUSTERED INDEX [IX_AbpOrganizationUnits_TenantId_Code] ON [dbo].[AbpOrganizationUnits]
(
	[TenantId] ASC,
	[Code] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_AbpPermissions_RoleId]    Script Date: 5/9/2025 3:32:24 PM ******/
CREATE NONCLUSTERED INDEX [IX_AbpPermissions_RoleId] ON [dbo].[AbpPermissions]
(
	[RoleId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IX_AbpPermissions_TenantId_Name]    Script Date: 5/9/2025 3:32:24 PM ******/
CREATE NONCLUSTERED INDEX [IX_AbpPermissions_TenantId_Name] ON [dbo].[AbpPermissions]
(
	[TenantId] ASC,
	[Name] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_AbpPermissions_UserId]    Script Date: 5/9/2025 3:32:24 PM ******/
CREATE NONCLUSTERED INDEX [IX_AbpPermissions_UserId] ON [dbo].[AbpPermissions]
(
	[UserId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_AbpRoleClaims_RoleId]    Script Date: 5/9/2025 3:32:24 PM ******/
CREATE NONCLUSTERED INDEX [IX_AbpRoleClaims_RoleId] ON [dbo].[AbpRoleClaims]
(
	[RoleId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IX_AbpRoleClaims_TenantId_ClaimType]    Script Date: 5/9/2025 3:32:24 PM ******/
CREATE NONCLUSTERED INDEX [IX_AbpRoleClaims_TenantId_ClaimType] ON [dbo].[AbpRoleClaims]
(
	[TenantId] ASC,
	[ClaimType] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_AbpRoles_CreatorUserId]    Script Date: 5/9/2025 3:32:24 PM ******/
CREATE NONCLUSTERED INDEX [IX_AbpRoles_CreatorUserId] ON [dbo].[AbpRoles]
(
	[CreatorUserId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_AbpRoles_DeleterUserId]    Script Date: 5/9/2025 3:32:24 PM ******/
CREATE NONCLUSTERED INDEX [IX_AbpRoles_DeleterUserId] ON [dbo].[AbpRoles]
(
	[DeleterUserId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_AbpRoles_LastModifierUserId]    Script Date: 5/9/2025 3:32:24 PM ******/
CREATE NONCLUSTERED INDEX [IX_AbpRoles_LastModifierUserId] ON [dbo].[AbpRoles]
(
	[LastModifierUserId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IX_AbpRoles_TenantId_NormalizedName]    Script Date: 5/9/2025 3:32:24 PM ******/
CREATE NONCLUSTERED INDEX [IX_AbpRoles_TenantId_NormalizedName] ON [dbo].[AbpRoles]
(
	[TenantId] ASC,
	[NormalizedName] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IX_AbpSettings_TenantId_Name_UserId]    Script Date: 5/9/2025 3:32:24 PM ******/
CREATE UNIQUE NONCLUSTERED INDEX [IX_AbpSettings_TenantId_Name_UserId] ON [dbo].[AbpSettings]
(
	[TenantId] ASC,
	[Name] ASC,
	[UserId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_AbpSettings_UserId]    Script Date: 5/9/2025 3:32:24 PM ******/
CREATE NONCLUSTERED INDEX [IX_AbpSettings_UserId] ON [dbo].[AbpSettings]
(
	[UserId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_AbpTenantNotifications_TenantId]    Script Date: 5/9/2025 3:32:24 PM ******/
CREATE NONCLUSTERED INDEX [IX_AbpTenantNotifications_TenantId] ON [dbo].[AbpTenantNotifications]
(
	[TenantId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_AbpTenants_CreatorUserId]    Script Date: 5/9/2025 3:32:24 PM ******/
CREATE NONCLUSTERED INDEX [IX_AbpTenants_CreatorUserId] ON [dbo].[AbpTenants]
(
	[CreatorUserId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_AbpTenants_DeleterUserId]    Script Date: 5/9/2025 3:32:24 PM ******/
CREATE NONCLUSTERED INDEX [IX_AbpTenants_DeleterUserId] ON [dbo].[AbpTenants]
(
	[DeleterUserId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_AbpTenants_EditionId]    Script Date: 5/9/2025 3:32:24 PM ******/
CREATE NONCLUSTERED INDEX [IX_AbpTenants_EditionId] ON [dbo].[AbpTenants]
(
	[EditionId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_AbpTenants_LastModifierUserId]    Script Date: 5/9/2025 3:32:24 PM ******/
CREATE NONCLUSTERED INDEX [IX_AbpTenants_LastModifierUserId] ON [dbo].[AbpTenants]
(
	[LastModifierUserId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IX_AbpTenants_TenancyName]    Script Date: 5/9/2025 3:32:24 PM ******/
CREATE NONCLUSTERED INDEX [IX_AbpTenants_TenancyName] ON [dbo].[AbpTenants]
(
	[TenancyName] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IX_AbpUserAccounts_EmailAddress]    Script Date: 5/9/2025 3:32:24 PM ******/
CREATE NONCLUSTERED INDEX [IX_AbpUserAccounts_EmailAddress] ON [dbo].[AbpUserAccounts]
(
	[EmailAddress] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IX_AbpUserAccounts_TenantId_EmailAddress]    Script Date: 5/9/2025 3:32:24 PM ******/
CREATE NONCLUSTERED INDEX [IX_AbpUserAccounts_TenantId_EmailAddress] ON [dbo].[AbpUserAccounts]
(
	[TenantId] ASC,
	[EmailAddress] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_AbpUserAccounts_TenantId_UserId]    Script Date: 5/9/2025 3:32:24 PM ******/
CREATE NONCLUSTERED INDEX [IX_AbpUserAccounts_TenantId_UserId] ON [dbo].[AbpUserAccounts]
(
	[TenantId] ASC,
	[UserId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IX_AbpUserAccounts_TenantId_UserName]    Script Date: 5/9/2025 3:32:24 PM ******/
CREATE NONCLUSTERED INDEX [IX_AbpUserAccounts_TenantId_UserName] ON [dbo].[AbpUserAccounts]
(
	[TenantId] ASC,
	[UserName] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IX_AbpUserAccounts_UserName]    Script Date: 5/9/2025 3:32:24 PM ******/
CREATE NONCLUSTERED INDEX [IX_AbpUserAccounts_UserName] ON [dbo].[AbpUserAccounts]
(
	[UserName] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IX_AbpUserClaims_TenantId_ClaimType]    Script Date: 5/9/2025 3:32:24 PM ******/
CREATE NONCLUSTERED INDEX [IX_AbpUserClaims_TenantId_ClaimType] ON [dbo].[AbpUserClaims]
(
	[TenantId] ASC,
	[ClaimType] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_AbpUserClaims_UserId]    Script Date: 5/9/2025 3:32:24 PM ******/
CREATE NONCLUSTERED INDEX [IX_AbpUserClaims_UserId] ON [dbo].[AbpUserClaims]
(
	[UserId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IX_AbpUserLoginAttempts_TenancyName_UserNameOrEmailAddress_Result]    Script Date: 5/9/2025 3:32:24 PM ******/
CREATE NONCLUSTERED INDEX [IX_AbpUserLoginAttempts_TenancyName_UserNameOrEmailAddress_Result] ON [dbo].[AbpUserLoginAttempts]
(
	[TenancyName] ASC,
	[UserNameOrEmailAddress] ASC,
	[Result] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_AbpUserLoginAttempts_UserId_TenantId]    Script Date: 5/9/2025 3:32:24 PM ******/
CREATE NONCLUSTERED INDEX [IX_AbpUserLoginAttempts_UserId_TenantId] ON [dbo].[AbpUserLoginAttempts]
(
	[UserId] ASC,
	[TenantId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IX_AbpUserLogins_ProviderKey_TenantId]    Script Date: 5/9/2025 3:32:24 PM ******/
CREATE UNIQUE NONCLUSTERED INDEX [IX_AbpUserLogins_ProviderKey_TenantId] ON [dbo].[AbpUserLogins]
(
	[ProviderKey] ASC,
	[TenantId] ASC
)
WHERE ([TenantId] IS NOT NULL)
WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IX_AbpUserLogins_TenantId_LoginProvider_ProviderKey]    Script Date: 5/9/2025 3:32:24 PM ******/
CREATE NONCLUSTERED INDEX [IX_AbpUserLogins_TenantId_LoginProvider_ProviderKey] ON [dbo].[AbpUserLogins]
(
	[TenantId] ASC,
	[LoginProvider] ASC,
	[ProviderKey] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_AbpUserLogins_TenantId_UserId]    Script Date: 5/9/2025 3:32:24 PM ******/
CREATE NONCLUSTERED INDEX [IX_AbpUserLogins_TenantId_UserId] ON [dbo].[AbpUserLogins]
(
	[TenantId] ASC,
	[UserId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_AbpUserLogins_UserId]    Script Date: 5/9/2025 3:32:24 PM ******/
CREATE NONCLUSTERED INDEX [IX_AbpUserLogins_UserId] ON [dbo].[AbpUserLogins]
(
	[UserId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_AbpUserNotifications_UserId_State_CreationTime]    Script Date: 5/9/2025 3:32:24 PM ******/
CREATE NONCLUSTERED INDEX [IX_AbpUserNotifications_UserId_State_CreationTime] ON [dbo].[AbpUserNotifications]
(
	[UserId] ASC,
	[State] ASC,
	[CreationTime] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_AbpUserOrganizationUnits_TenantId_OrganizationUnitId]    Script Date: 5/9/2025 3:32:24 PM ******/
CREATE NONCLUSTERED INDEX [IX_AbpUserOrganizationUnits_TenantId_OrganizationUnitId] ON [dbo].[AbpUserOrganizationUnits]
(
	[TenantId] ASC,
	[OrganizationUnitId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_AbpUserOrganizationUnits_TenantId_UserId]    Script Date: 5/9/2025 3:32:24 PM ******/
CREATE NONCLUSTERED INDEX [IX_AbpUserOrganizationUnits_TenantId_UserId] ON [dbo].[AbpUserOrganizationUnits]
(
	[TenantId] ASC,
	[UserId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_AbpUserRoles_TenantId_RoleId]    Script Date: 5/9/2025 3:32:24 PM ******/
CREATE NONCLUSTERED INDEX [IX_AbpUserRoles_TenantId_RoleId] ON [dbo].[AbpUserRoles]
(
	[TenantId] ASC,
	[RoleId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_AbpUserRoles_TenantId_UserId]    Script Date: 5/9/2025 3:32:24 PM ******/
CREATE NONCLUSTERED INDEX [IX_AbpUserRoles_TenantId_UserId] ON [dbo].[AbpUserRoles]
(
	[TenantId] ASC,
	[UserId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_AbpUserRoles_UserId]    Script Date: 5/9/2025 3:32:24 PM ******/
CREATE NONCLUSTERED INDEX [IX_AbpUserRoles_UserId] ON [dbo].[AbpUserRoles]
(
	[UserId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_AbpUsers_CreatorUserId]    Script Date: 5/9/2025 3:32:24 PM ******/
CREATE NONCLUSTERED INDEX [IX_AbpUsers_CreatorUserId] ON [dbo].[AbpUsers]
(
	[CreatorUserId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_AbpUsers_DeleterUserId]    Script Date: 5/9/2025 3:32:24 PM ******/
CREATE NONCLUSTERED INDEX [IX_AbpUsers_DeleterUserId] ON [dbo].[AbpUsers]
(
	[DeleterUserId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_AbpUsers_LastModifierUserId]    Script Date: 5/9/2025 3:32:24 PM ******/
CREATE NONCLUSTERED INDEX [IX_AbpUsers_LastModifierUserId] ON [dbo].[AbpUsers]
(
	[LastModifierUserId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IX_AbpUsers_TenantId_NormalizedEmailAddress]    Script Date: 5/9/2025 3:32:24 PM ******/
CREATE NONCLUSTERED INDEX [IX_AbpUsers_TenantId_NormalizedEmailAddress] ON [dbo].[AbpUsers]
(
	[TenantId] ASC,
	[NormalizedEmailAddress] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IX_AbpUsers_TenantId_NormalizedUserName]    Script Date: 5/9/2025 3:32:24 PM ******/
CREATE NONCLUSTERED INDEX [IX_AbpUsers_TenantId_NormalizedUserName] ON [dbo].[AbpUsers]
(
	[TenantId] ASC,
	[NormalizedUserName] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_AbpUserTokens_TenantId_UserId]    Script Date: 5/9/2025 3:32:24 PM ******/
CREATE NONCLUSTERED INDEX [IX_AbpUserTokens_TenantId_UserId] ON [dbo].[AbpUserTokens]
(
	[TenantId] ASC,
	[UserId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_AbpUserTokens_UserId]    Script Date: 5/9/2025 3:32:24 PM ******/
CREATE NONCLUSTERED INDEX [IX_AbpUserTokens_UserId] ON [dbo].[AbpUserTokens]
(
	[UserId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_AbpWebhookSendAttempts_WebhookEventId]    Script Date: 5/9/2025 3:32:24 PM ******/
CREATE NONCLUSTERED INDEX [IX_AbpWebhookSendAttempts_WebhookEventId] ON [dbo].[AbpWebhookSendAttempts]
(
	[WebhookEventId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_BusInstallments_BusFeePlanId_Order]    Script Date: 5/9/2025 3:32:24 PM ******/
CREATE UNIQUE NONCLUSTERED INDEX [IX_BusInstallments_BusFeePlanId_Order] ON [dbo].[BusInstallments]
(
	[BusFeePlanId] ASC,
	[Order] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_EducationalInstallments_EducationalFeePlanId_Order]    Script Date: 5/9/2025 3:32:24 PM ******/
CREATE UNIQUE NONCLUSTERED INDEX [IX_EducationalInstallments_EducationalFeePlanId_Order] ON [dbo].[EducationalInstallments]
(
	[EducationalFeePlanId] ASC,
	[Order] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_StudentBusPayments_BusInstallmentId]    Script Date: 5/9/2025 3:32:24 PM ******/
CREATE NONCLUSTERED INDEX [IX_StudentBusPayments_BusInstallmentId] ON [dbo].[StudentBusPayments]
(
	[BusInstallmentId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_StudentBusPayments_BusSubscriptionId]    Script Date: 5/9/2025 3:32:24 PM ******/
CREATE NONCLUSTERED INDEX [IX_StudentBusPayments_BusSubscriptionId] ON [dbo].[StudentBusPayments]
(
	[BusSubscriptionId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_StudentBusSubscriptions_BusFeePlanId]    Script Date: 5/9/2025 3:32:24 PM ******/
CREATE NONCLUSTERED INDEX [IX_StudentBusSubscriptions_BusFeePlanId] ON [dbo].[StudentBusSubscriptions]
(
	[BusFeePlanId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_StudentBusSubscriptions_StudentId]    Script Date: 5/9/2025 3:32:24 PM ******/
CREATE NONCLUSTERED INDEX [IX_StudentBusSubscriptions_StudentId] ON [dbo].[StudentBusSubscriptions]
(
	[StudentId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_StudentEducationalPayments_EducationalInstallmentId]    Script Date: 5/9/2025 3:32:24 PM ******/
CREATE NONCLUSTERED INDEX [IX_StudentEducationalPayments_EducationalInstallmentId] ON [dbo].[StudentEducationalPayments]
(
	[EducationalInstallmentId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_StudentEducationalPayments_StudentId]    Script Date: 5/9/2025 3:32:24 PM ******/
CREATE NONCLUSTERED INDEX [IX_StudentEducationalPayments_StudentId] ON [dbo].[StudentEducationalPayments]
(
	[StudentId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
ALTER TABLE [dbo].[AbpDynamicEntityProperties]  WITH CHECK ADD  CONSTRAINT [FK_AbpDynamicEntityProperties_AbpDynamicProperties_DynamicPropertyId] FOREIGN KEY([DynamicPropertyId])
REFERENCES [dbo].[AbpDynamicProperties] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[AbpDynamicEntityProperties] CHECK CONSTRAINT [FK_AbpDynamicEntityProperties_AbpDynamicProperties_DynamicPropertyId]
GO
ALTER TABLE [dbo].[AbpDynamicEntityPropertyValues]  WITH CHECK ADD  CONSTRAINT [FK_AbpDynamicEntityPropertyValues_AbpDynamicEntityProperties_DynamicEntityPropertyId] FOREIGN KEY([DynamicEntityPropertyId])
REFERENCES [dbo].[AbpDynamicEntityProperties] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[AbpDynamicEntityPropertyValues] CHECK CONSTRAINT [FK_AbpDynamicEntityPropertyValues_AbpDynamicEntityProperties_DynamicEntityPropertyId]
GO
ALTER TABLE [dbo].[AbpDynamicPropertyValues]  WITH CHECK ADD  CONSTRAINT [FK_AbpDynamicPropertyValues_AbpDynamicProperties_DynamicPropertyId] FOREIGN KEY([DynamicPropertyId])
REFERENCES [dbo].[AbpDynamicProperties] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[AbpDynamicPropertyValues] CHECK CONSTRAINT [FK_AbpDynamicPropertyValues_AbpDynamicProperties_DynamicPropertyId]
GO
ALTER TABLE [dbo].[AbpEntityChanges]  WITH CHECK ADD  CONSTRAINT [FK_AbpEntityChanges_AbpEntityChangeSets_EntityChangeSetId] FOREIGN KEY([EntityChangeSetId])
REFERENCES [dbo].[AbpEntityChangeSets] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[AbpEntityChanges] CHECK CONSTRAINT [FK_AbpEntityChanges_AbpEntityChangeSets_EntityChangeSetId]
GO
ALTER TABLE [dbo].[AbpEntityPropertyChanges]  WITH CHECK ADD  CONSTRAINT [FK_AbpEntityPropertyChanges_AbpEntityChanges_EntityChangeId] FOREIGN KEY([EntityChangeId])
REFERENCES [dbo].[AbpEntityChanges] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[AbpEntityPropertyChanges] CHECK CONSTRAINT [FK_AbpEntityPropertyChanges_AbpEntityChanges_EntityChangeId]
GO
ALTER TABLE [dbo].[AbpFeatures]  WITH CHECK ADD  CONSTRAINT [FK_AbpFeatures_AbpEditions_EditionId] FOREIGN KEY([EditionId])
REFERENCES [dbo].[AbpEditions] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[AbpFeatures] CHECK CONSTRAINT [FK_AbpFeatures_AbpEditions_EditionId]
GO
ALTER TABLE [dbo].[AbpOrganizationUnits]  WITH CHECK ADD  CONSTRAINT [FK_AbpOrganizationUnits_AbpOrganizationUnits_ParentId] FOREIGN KEY([ParentId])
REFERENCES [dbo].[AbpOrganizationUnits] ([Id])
GO
ALTER TABLE [dbo].[AbpOrganizationUnits] CHECK CONSTRAINT [FK_AbpOrganizationUnits_AbpOrganizationUnits_ParentId]
GO
ALTER TABLE [dbo].[AbpPermissions]  WITH CHECK ADD  CONSTRAINT [FK_AbpPermissions_AbpRoles_RoleId] FOREIGN KEY([RoleId])
REFERENCES [dbo].[AbpRoles] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[AbpPermissions] CHECK CONSTRAINT [FK_AbpPermissions_AbpRoles_RoleId]
GO
ALTER TABLE [dbo].[AbpPermissions]  WITH CHECK ADD  CONSTRAINT [FK_AbpPermissions_AbpUsers_UserId] FOREIGN KEY([UserId])
REFERENCES [dbo].[AbpUsers] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[AbpPermissions] CHECK CONSTRAINT [FK_AbpPermissions_AbpUsers_UserId]
GO
ALTER TABLE [dbo].[AbpRoleClaims]  WITH CHECK ADD  CONSTRAINT [FK_AbpRoleClaims_AbpRoles_RoleId] FOREIGN KEY([RoleId])
REFERENCES [dbo].[AbpRoles] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[AbpRoleClaims] CHECK CONSTRAINT [FK_AbpRoleClaims_AbpRoles_RoleId]
GO
ALTER TABLE [dbo].[AbpRoles]  WITH CHECK ADD  CONSTRAINT [FK_AbpRoles_AbpUsers_CreatorUserId] FOREIGN KEY([CreatorUserId])
REFERENCES [dbo].[AbpUsers] ([Id])
GO
ALTER TABLE [dbo].[AbpRoles] CHECK CONSTRAINT [FK_AbpRoles_AbpUsers_CreatorUserId]
GO
ALTER TABLE [dbo].[AbpRoles]  WITH CHECK ADD  CONSTRAINT [FK_AbpRoles_AbpUsers_DeleterUserId] FOREIGN KEY([DeleterUserId])
REFERENCES [dbo].[AbpUsers] ([Id])
GO
ALTER TABLE [dbo].[AbpRoles] CHECK CONSTRAINT [FK_AbpRoles_AbpUsers_DeleterUserId]
GO
ALTER TABLE [dbo].[AbpRoles]  WITH CHECK ADD  CONSTRAINT [FK_AbpRoles_AbpUsers_LastModifierUserId] FOREIGN KEY([LastModifierUserId])
REFERENCES [dbo].[AbpUsers] ([Id])
GO
ALTER TABLE [dbo].[AbpRoles] CHECK CONSTRAINT [FK_AbpRoles_AbpUsers_LastModifierUserId]
GO
ALTER TABLE [dbo].[AbpSettings]  WITH CHECK ADD  CONSTRAINT [FK_AbpSettings_AbpUsers_UserId] FOREIGN KEY([UserId])
REFERENCES [dbo].[AbpUsers] ([Id])
GO
ALTER TABLE [dbo].[AbpSettings] CHECK CONSTRAINT [FK_AbpSettings_AbpUsers_UserId]
GO
ALTER TABLE [dbo].[AbpTenants]  WITH CHECK ADD  CONSTRAINT [FK_AbpTenants_AbpEditions_EditionId] FOREIGN KEY([EditionId])
REFERENCES [dbo].[AbpEditions] ([Id])
GO
ALTER TABLE [dbo].[AbpTenants] CHECK CONSTRAINT [FK_AbpTenants_AbpEditions_EditionId]
GO
ALTER TABLE [dbo].[AbpTenants]  WITH CHECK ADD  CONSTRAINT [FK_AbpTenants_AbpUsers_CreatorUserId] FOREIGN KEY([CreatorUserId])
REFERENCES [dbo].[AbpUsers] ([Id])
GO
ALTER TABLE [dbo].[AbpTenants] CHECK CONSTRAINT [FK_AbpTenants_AbpUsers_CreatorUserId]
GO
ALTER TABLE [dbo].[AbpTenants]  WITH CHECK ADD  CONSTRAINT [FK_AbpTenants_AbpUsers_DeleterUserId] FOREIGN KEY([DeleterUserId])
REFERENCES [dbo].[AbpUsers] ([Id])
GO
ALTER TABLE [dbo].[AbpTenants] CHECK CONSTRAINT [FK_AbpTenants_AbpUsers_DeleterUserId]
GO
ALTER TABLE [dbo].[AbpTenants]  WITH CHECK ADD  CONSTRAINT [FK_AbpTenants_AbpUsers_LastModifierUserId] FOREIGN KEY([LastModifierUserId])
REFERENCES [dbo].[AbpUsers] ([Id])
GO
ALTER TABLE [dbo].[AbpTenants] CHECK CONSTRAINT [FK_AbpTenants_AbpUsers_LastModifierUserId]
GO
ALTER TABLE [dbo].[AbpUserClaims]  WITH CHECK ADD  CONSTRAINT [FK_AbpUserClaims_AbpUsers_UserId] FOREIGN KEY([UserId])
REFERENCES [dbo].[AbpUsers] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[AbpUserClaims] CHECK CONSTRAINT [FK_AbpUserClaims_AbpUsers_UserId]
GO
ALTER TABLE [dbo].[AbpUserLogins]  WITH CHECK ADD  CONSTRAINT [FK_AbpUserLogins_AbpUsers_UserId] FOREIGN KEY([UserId])
REFERENCES [dbo].[AbpUsers] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[AbpUserLogins] CHECK CONSTRAINT [FK_AbpUserLogins_AbpUsers_UserId]
GO
ALTER TABLE [dbo].[AbpUserRoles]  WITH CHECK ADD  CONSTRAINT [FK_AbpUserRoles_AbpUsers_UserId] FOREIGN KEY([UserId])
REFERENCES [dbo].[AbpUsers] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[AbpUserRoles] CHECK CONSTRAINT [FK_AbpUserRoles_AbpUsers_UserId]
GO
ALTER TABLE [dbo].[AbpUsers]  WITH CHECK ADD  CONSTRAINT [FK_AbpUsers_AbpUsers_CreatorUserId] FOREIGN KEY([CreatorUserId])
REFERENCES [dbo].[AbpUsers] ([Id])
GO
ALTER TABLE [dbo].[AbpUsers] CHECK CONSTRAINT [FK_AbpUsers_AbpUsers_CreatorUserId]
GO
ALTER TABLE [dbo].[AbpUsers]  WITH CHECK ADD  CONSTRAINT [FK_AbpUsers_AbpUsers_DeleterUserId] FOREIGN KEY([DeleterUserId])
REFERENCES [dbo].[AbpUsers] ([Id])
GO
ALTER TABLE [dbo].[AbpUsers] CHECK CONSTRAINT [FK_AbpUsers_AbpUsers_DeleterUserId]
GO
ALTER TABLE [dbo].[AbpUsers]  WITH CHECK ADD  CONSTRAINT [FK_AbpUsers_AbpUsers_LastModifierUserId] FOREIGN KEY([LastModifierUserId])
REFERENCES [dbo].[AbpUsers] ([Id])
GO
ALTER TABLE [dbo].[AbpUsers] CHECK CONSTRAINT [FK_AbpUsers_AbpUsers_LastModifierUserId]
GO
ALTER TABLE [dbo].[AbpUserTokens]  WITH CHECK ADD  CONSTRAINT [FK_AbpUserTokens_AbpUsers_UserId] FOREIGN KEY([UserId])
REFERENCES [dbo].[AbpUsers] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[AbpUserTokens] CHECK CONSTRAINT [FK_AbpUserTokens_AbpUsers_UserId]
GO
ALTER TABLE [dbo].[AbpWebhookSendAttempts]  WITH CHECK ADD  CONSTRAINT [FK_AbpWebhookSendAttempts_AbpWebhookEvents_WebhookEventId] FOREIGN KEY([WebhookEventId])
REFERENCES [dbo].[AbpWebhookEvents] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[AbpWebhookSendAttempts] CHECK CONSTRAINT [FK_AbpWebhookSendAttempts_AbpWebhookEvents_WebhookEventId]
GO
ALTER TABLE [dbo].[BusInstallments]  WITH CHECK ADD  CONSTRAINT [FK_BusInstallments_BusFeePlans_BusFeePlanId] FOREIGN KEY([BusFeePlanId])
REFERENCES [dbo].[BusFeePlans] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[BusInstallments] CHECK CONSTRAINT [FK_BusInstallments_BusFeePlans_BusFeePlanId]
GO
ALTER TABLE [dbo].[EducationalInstallments]  WITH CHECK ADD  CONSTRAINT [FK_EducationalInstallments_EducationalFeePlans_EducationalFeePlanId] FOREIGN KEY([EducationalFeePlanId])
REFERENCES [dbo].[EducationalFeePlans] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[EducationalInstallments] CHECK CONSTRAINT [FK_EducationalInstallments_EducationalFeePlans_EducationalFeePlanId]
GO
ALTER TABLE [dbo].[StudentBusPayments]  WITH CHECK ADD  CONSTRAINT [FK_StudentBusPayments_BusInstallments_BusInstallmentId] FOREIGN KEY([BusInstallmentId])
REFERENCES [dbo].[BusInstallments] ([Id])
GO
ALTER TABLE [dbo].[StudentBusPayments] CHECK CONSTRAINT [FK_StudentBusPayments_BusInstallments_BusInstallmentId]
GO
ALTER TABLE [dbo].[StudentBusPayments]  WITH CHECK ADD  CONSTRAINT [FK_StudentBusPayments_StudentBusSubscriptions_BusSubscriptionId] FOREIGN KEY([BusSubscriptionId])
REFERENCES [dbo].[StudentBusSubscriptions] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[StudentBusPayments] CHECK CONSTRAINT [FK_StudentBusPayments_StudentBusSubscriptions_BusSubscriptionId]
GO
ALTER TABLE [dbo].[StudentBusSubscriptions]  WITH CHECK ADD  CONSTRAINT [FK_StudentBusSubscriptions_BusFeePlans_BusFeePlanId] FOREIGN KEY([BusFeePlanId])
REFERENCES [dbo].[BusFeePlans] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[StudentBusSubscriptions] CHECK CONSTRAINT [FK_StudentBusSubscriptions_BusFeePlans_BusFeePlanId]
GO
ALTER TABLE [dbo].[StudentBusSubscriptions]  WITH CHECK ADD  CONSTRAINT [FK_StudentBusSubscriptions_Students_StudentId] FOREIGN KEY([StudentId])
REFERENCES [dbo].[Students] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[StudentBusSubscriptions] CHECK CONSTRAINT [FK_StudentBusSubscriptions_Students_StudentId]
GO
ALTER TABLE [dbo].[StudentEducationalPayments]  WITH CHECK ADD  CONSTRAINT [FK_StudentEducationalPayments_EducationalInstallments_EducationalInstallmentId] FOREIGN KEY([EducationalInstallmentId])
REFERENCES [dbo].[EducationalInstallments] ([Id])
GO
ALTER TABLE [dbo].[StudentEducationalPayments] CHECK CONSTRAINT [FK_StudentEducationalPayments_EducationalInstallments_EducationalInstallmentId]
GO
ALTER TABLE [dbo].[StudentEducationalPayments]  WITH CHECK ADD  CONSTRAINT [FK_StudentEducationalPayments_Students_StudentId] FOREIGN KEY([StudentId])
REFERENCES [dbo].[Students] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[StudentEducationalPayments] CHECK CONSTRAINT [FK_StudentEducationalPayments_Students_StudentId]
GO
USE [master]
GO
ALTER DATABASE [LMSDb] SET  READ_WRITE 
GO
