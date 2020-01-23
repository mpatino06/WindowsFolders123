using System;
using Microsoft.EntityFrameworkCore;
using Microsoft.EntityFrameworkCore.Metadata;

namespace WindowsFolders123.Core.Models
{
    public partial class DBDataIfxContext : DbContext
    {
        public DBDataIfxContext()
        {
        }

        public DBDataIfxContext(DbContextOptions<DBDataIfxContext> options)
            : base(options)
        {
        }

        public virtual DbSet<Files> Files { get; set; }
        public virtual DbSet<Folder> Folder { get; set; }

        protected override void OnConfiguring(DbContextOptionsBuilder optionsBuilder)
        {
            if (!optionsBuilder.IsConfigured)
            {
#warning To protect potentially sensitive information in your connection string, you should move it out of source code. See http://go.microsoft.com/fwlink/?LinkId=723263 for guidance on storing connection strings.
                optionsBuilder.UseSqlServer("Server=DESKTOP-IBN05PO;Database=DBDataIfx;User Id=sa;Password=123456;Trusted_Connection=True;");
            }
        }

        protected override void OnModelCreating(ModelBuilder modelBuilder)
        {
            modelBuilder.Entity<Files>(entity =>
            {
                entity.Property(e => e.FileName).HasMaxLength(250);

                entity.HasOne(d => d.Folder)
                    .WithMany(p => p.Files)
                    .HasForeignKey(d => d.FolderId)
                    .OnDelete(DeleteBehavior.ClientSetNull)
                    .HasConstraintName("FK_Files_Folder");
            });
        }
    }
}
