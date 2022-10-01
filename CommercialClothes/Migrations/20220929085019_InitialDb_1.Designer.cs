﻿// <auto-generated />
using System;
using ComercialClothes.Models;
using CommercialClothes.Models;
using Microsoft.EntityFrameworkCore;
using Microsoft.EntityFrameworkCore.Infrastructure;
using Microsoft.EntityFrameworkCore.Metadata;
using Microsoft.EntityFrameworkCore.Migrations;
using Microsoft.EntityFrameworkCore.Storage.ValueConversion;

namespace CommercialClothes.Migrations
{
    [DbContext(typeof(ECommerceSellingClothesContext))]
    [Migration("20220929085019_InitialDb_1")]
    partial class InitialDb_1
    {
        protected override void BuildTargetModel(ModelBuilder modelBuilder)
        {
#pragma warning disable 612, 618
            modelBuilder
                .HasAnnotation("Relational:MaxIdentifierLength", 128)
                .HasAnnotation("ProductVersion", "5.0.17")
                .HasAnnotation("SqlServer:ValueGenerationStrategy", SqlServerValueGenerationStrategy.IdentityColumn);

            modelBuilder.Entity("ComercialClothes.Models.Account", b =>
                {
                    b.Property<int>("Id")
                        .ValueGeneratedOnAdd()
                        .HasColumnType("int")
                        .HasAnnotation("SqlServer:ValueGenerationStrategy", SqlServerValueGenerationStrategy.IdentityColumn);

                    b.Property<string>("Address")
                        .HasColumnType("nvarchar(max)");

                    b.Property<DateTime>("DateCreated")
                        .HasColumnType("datetime2");

                    b.Property<string>("Name")
                        .HasColumnType("nvarchar(max)");

                    b.Property<string>("Password")
                        .IsRequired()
                        .HasColumnType("nvarchar(max)");

                    b.Property<string>("PhoneNumber")
                        .HasColumnType("nvarchar(max)");

                    b.Property<int?>("ShopId")
                        .HasColumnType("int");

                    b.Property<int?>("UserGroupId")
                        .HasColumnType("int");

                    b.Property<string>("UserName")
                        .IsRequired()
                        .HasColumnType("nvarchar(max)");

                    b.HasKey("Id");

                    b.HasIndex("ShopId");

                    b.HasIndex("UserGroupId");

                    b.ToTable("Accounts");
                });

            modelBuilder.Entity("ComercialClothes.Models.Category", b =>
                {
                    b.Property<int>("Id")
                        .ValueGeneratedOnAdd()
                        .HasColumnType("int")
                        .HasAnnotation("SqlServer:ValueGenerationStrategy", SqlServerValueGenerationStrategy.IdentityColumn);

                    b.Property<string>("Description")
                        .HasColumnType("nvarchar(max)");

                    b.Property<bool>("Gender")
                        .HasColumnType("bit");

                    b.Property<string>("Name")
                        .HasColumnType("nvarchar(max)");

                    b.Property<int?>("ParentId")
                        .HasColumnType("int");

                    b.Property<int?>("ShopId")
                        .HasColumnType("int");

                    b.HasKey("Id");

                    b.HasIndex("ShopId");

                    b.ToTable("Categories");
                });

            modelBuilder.Entity("ComercialClothes.Models.Credential", b =>
                {
                    b.Property<int>("RoleId")
                        .HasColumnType("int");

                    b.Property<int>("UserGroupId")
                        .HasColumnType("int");

                    b.HasIndex("RoleId");

                    b.HasIndex("UserGroupId");

                    b.ToTable("Credentials");
                });

            modelBuilder.Entity("ComercialClothes.Models.Image", b =>
                {
                    b.Property<int>("Id")
                        .ValueGeneratedOnAdd()
                        .HasColumnType("int")
                        .HasAnnotation("SqlServer:ValueGenerationStrategy", SqlServerValueGenerationStrategy.IdentityColumn);

                    b.Property<int?>("ItemId")
                        .HasColumnType("int");

                    b.Property<string>("Path")
                        .HasColumnType("nvarchar(max)");

                    b.Property<int?>("ShopId")
                        .HasColumnType("int");

                    b.HasKey("Id");

                    b.HasIndex("ItemId");

                    b.HasIndex("ShopId");

                    b.ToTable("Images");
                });

            modelBuilder.Entity("ComercialClothes.Models.Item", b =>
                {
                    b.Property<int>("Id")
                        .ValueGeneratedOnAdd()
                        .HasColumnType("int")
                        .HasAnnotation("SqlServer:ValueGenerationStrategy", SqlServerValueGenerationStrategy.IdentityColumn);

                    b.Property<int>("CategoryId")
                        .HasColumnType("int");

                    b.Property<DateTime?>("DateCreated")
                        .HasColumnType("datetime2");

                    b.Property<string>("Description")
                        .HasColumnType("nvarchar(max)");

                    b.Property<string>("Name")
                        .HasColumnType("nvarchar(max)");

                    b.Property<int>("Price")
                        .HasColumnType("int");

                    b.Property<int>("Quantity")
                        .HasColumnType("int");

                    b.Property<int>("ShopId")
                        .HasColumnType("int");

                    b.Property<string>("Size")
                        .HasColumnType("nvarchar(max)");

                    b.HasKey("Id");

                    b.HasIndex("CategoryId");

                    b.ToTable("Items");
                });

            modelBuilder.Entity("ComercialClothes.Models.Order", b =>
                {
                    b.Property<int>("Id")
                        .ValueGeneratedOnAdd()
                        .HasColumnType("int")
                        .HasAnnotation("SqlServer:ValueGenerationStrategy", SqlServerValueGenerationStrategy.IdentityColumn);

                    b.Property<int>("AccountId")
                        .HasColumnType("int");

                    b.Property<string>("Address")
                        .HasColumnType("nvarchar(max)");

                    b.Property<DateTime>("DateCreate")
                        .HasColumnType("datetime2");

                    b.Property<int>("PaymentId")
                        .HasColumnType("int");

                    b.Property<string>("PhoneNumber")
                        .HasColumnType("nvarchar(max)");

                    b.Property<int>("StatusId")
                        .HasColumnType("int");

                    b.HasKey("Id");

                    b.HasIndex("AccountId");

                    b.HasIndex("PaymentId");

                    b.HasIndex("StatusId");

                    b.ToTable("Ordereds");
                });

            modelBuilder.Entity("ComercialClothes.Models.OrderDetail", b =>
                {
                    b.Property<int>("Id")
                        .ValueGeneratedOnAdd()
                        .HasColumnType("int")
                        .HasAnnotation("SqlServer:ValueGenerationStrategy", SqlServerValueGenerationStrategy.IdentityColumn);

                    b.Property<int>("ItemId")
                        .HasColumnType("int");

                    b.Property<int>("OrderId")
                        .HasColumnType("int");

                    b.Property<int?>("Quantity")
                        .HasColumnType("int");

                    b.HasKey("Id");

                    b.HasIndex("ItemId");

                    b.HasIndex("OrderId");

                    b.ToTable("OrderDetails");
                });

            modelBuilder.Entity("ComercialClothes.Models.Payment", b =>
                {
                    b.Property<int>("Id")
                        .HasColumnType("int");

                    b.Property<string>("Type")
                        .HasMaxLength(255)
                        .IsUnicode(false)
                        .HasColumnType("varchar(255)");

                    b.HasKey("Id");

                    b.ToTable("Payment");
                });

            modelBuilder.Entity("ComercialClothes.Models.Role", b =>
                {
                    b.Property<int>("Id")
                        .ValueGeneratedOnAdd()
                        .HasColumnType("int")
                        .HasAnnotation("SqlServer:ValueGenerationStrategy", SqlServerValueGenerationStrategy.IdentityColumn);

                    b.Property<string>("Name")
                        .HasColumnType("nvarchar(max)");

                    b.HasKey("Id");

                    b.ToTable("Roles");
                });

            modelBuilder.Entity("ComercialClothes.Models.Shop", b =>
                {
                    b.Property<int>("Id")
                        .ValueGeneratedOnAdd()
                        .HasColumnType("int")
                        .HasAnnotation("SqlServer:ValueGenerationStrategy", SqlServerValueGenerationStrategy.IdentityColumn);

                    b.Property<string>("Address")
                        .IsRequired()
                        .HasMaxLength(255)
                        .IsUnicode(false)
                        .HasColumnType("varchar(255)");

                    b.Property<DateTime>("DateCreated")
                        .HasColumnType("datetime");

                    b.Property<string>("Name")
                        .IsRequired()
                        .HasMaxLength(255)
                        .IsUnicode(false)
                        .HasColumnType("varchar(255)");

                    b.Property<string>("PhomeNumber")
                        .IsRequired()
                        .HasMaxLength(10)
                        .IsUnicode(false)
                        .HasColumnType("varchar(10)");

                    b.HasKey("Id");

                    b.ToTable("Shop");
                });

            modelBuilder.Entity("ComercialClothes.Models.Status", b =>
                {
                    b.Property<int>("Id")
                        .ValueGeneratedOnAdd()
                        .HasColumnType("int")
                        .HasAnnotation("SqlServer:ValueGenerationStrategy", SqlServerValueGenerationStrategy.IdentityColumn);

                    b.Property<string>("Name")
                        .HasColumnType("nvarchar(max)");

                    b.HasKey("Id");

                    b.ToTable("Statuses");
                });

            modelBuilder.Entity("ComercialClothes.Models.UserGroup", b =>
                {
                    b.Property<int>("Id")
                        .ValueGeneratedOnAdd()
                        .HasColumnType("int")
                        .HasAnnotation("SqlServer:ValueGenerationStrategy", SqlServerValueGenerationStrategy.IdentityColumn);

                    b.Property<string>("Name")
                        .HasColumnType("nvarchar(max)");

                    b.HasKey("Id");

                    b.ToTable("UserGroups");
                });

            modelBuilder.Entity("ComercialClothes.Models.Account", b =>
                {
                    b.HasOne("ComercialClothes.Models.Shop", "Shop")
                        .WithMany("Accounts")
                        .HasForeignKey("ShopId");

                    b.HasOne("ComercialClothes.Models.UserGroup", "UserGroup")
                        .WithMany("Accounts")
                        .HasForeignKey("UserGroupId");

                    b.Navigation("Shop");

                    b.Navigation("UserGroup");
                });

            modelBuilder.Entity("ComercialClothes.Models.Category", b =>
                {
                    b.HasOne("ComercialClothes.Models.Shop", "Shop")
                        .WithMany("Categories")
                        .HasForeignKey("ShopId");

                    b.Navigation("Shop");
                });

            modelBuilder.Entity("ComercialClothes.Models.Credential", b =>
                {
                    b.HasOne("ComercialClothes.Models.Role", "Role")
                        .WithMany()
                        .HasForeignKey("RoleId")
                        .OnDelete(DeleteBehavior.Cascade)
                        .IsRequired();

                    b.HasOne("ComercialClothes.Models.UserGroup", "UserGroup")
                        .WithMany()
                        .HasForeignKey("UserGroupId")
                        .OnDelete(DeleteBehavior.Cascade)
                        .IsRequired();

                    b.Navigation("Role");

                    b.Navigation("UserGroup");
                });

            modelBuilder.Entity("ComercialClothes.Models.Image", b =>
                {
                    b.HasOne("ComercialClothes.Models.Item", "Item")
                        .WithMany("Images")
                        .HasForeignKey("ItemId");

                    b.HasOne("ComercialClothes.Models.Shop", "Shop")
                        .WithMany("Images")
                        .HasForeignKey("ShopId");

                    b.Navigation("Item");

                    b.Navigation("Shop");
                });

            modelBuilder.Entity("ComercialClothes.Models.Item", b =>
                {
                    b.HasOne("ComercialClothes.Models.Category", "Category")
                        .WithMany("Items")
                        .HasForeignKey("CategoryId")
                        .OnDelete(DeleteBehavior.Cascade)
                        .IsRequired();

                    b.Navigation("Category");
                });

            modelBuilder.Entity("ComercialClothes.Models.Order", b =>
                {
                    b.HasOne("ComercialClothes.Models.Account", "Account")
                        .WithMany("Ordereds")
                        .HasForeignKey("AccountId")
                        .OnDelete(DeleteBehavior.Cascade)
                        .IsRequired();

                    b.HasOne("ComercialClothes.Models.Payment", "Payment")
                        .WithMany("Ordereds")
                        .HasForeignKey("PaymentId")
                        .OnDelete(DeleteBehavior.Cascade)
                        .IsRequired();

                    b.HasOne("ComercialClothes.Models.Status", "Status")
                        .WithMany("Orders")
                        .HasForeignKey("StatusId")
                        .OnDelete(DeleteBehavior.Cascade)
                        .IsRequired();

                    b.Navigation("Account");

                    b.Navigation("Payment");

                    b.Navigation("Status");
                });

            modelBuilder.Entity("ComercialClothes.Models.OrderDetail", b =>
                {
                    b.HasOne("ComercialClothes.Models.Item", "Item")
                        .WithMany("OrderDetails")
                        .HasForeignKey("ItemId")
                        .OnDelete(DeleteBehavior.Cascade)
                        .IsRequired();

                    b.HasOne("ComercialClothes.Models.Order", "Order")
                        .WithMany("OrderDetails")
                        .HasForeignKey("OrderId")
                        .OnDelete(DeleteBehavior.Cascade)
                        .IsRequired();

                    b.Navigation("Item");

                    b.Navigation("Order");
                });

            modelBuilder.Entity("ComercialClothes.Models.Payment", b =>
                {
                    b.HasOne("ComercialClothes.Models.Shop", "Shop")
                        .WithOne("Payment")
                        .HasForeignKey("ComercialClothes.Models.Payment", "Id")
                        .HasConstraintName("FK_Payment_Shop")
                        .IsRequired();

                    b.Navigation("Shop");
                });

            modelBuilder.Entity("ComercialClothes.Models.Account", b =>
                {
                    b.Navigation("Ordereds");
                });

            modelBuilder.Entity("ComercialClothes.Models.Category", b =>
                {
                    b.Navigation("Items");
                });

            modelBuilder.Entity("ComercialClothes.Models.Item", b =>
                {
                    b.Navigation("Images");

                    b.Navigation("OrderDetails");
                });

            modelBuilder.Entity("ComercialClothes.Models.Order", b =>
                {
                    b.Navigation("OrderDetails");
                });

            modelBuilder.Entity("ComercialClothes.Models.Payment", b =>
                {
                    b.Navigation("Ordereds");
                });

            modelBuilder.Entity("ComercialClothes.Models.Shop", b =>
                {
                    b.Navigation("Accounts");

                    b.Navigation("Categories");

                    b.Navigation("Images");

                    b.Navigation("Payment");
                });

            modelBuilder.Entity("ComercialClothes.Models.Status", b =>
                {
                    b.Navigation("Orders");
                });

            modelBuilder.Entity("ComercialClothes.Models.UserGroup", b =>
                {
                    b.Navigation("Accounts");
                });
#pragma warning restore 612, 618
        }
    }
}
