using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using KUETPhotoClub.Models;

public class DatabaseHelper
{
    private string connectionString = ConfigurationManager
        .ConnectionStrings["MyDbConnection"].ConnectionString;

    // ---- MEMBERS ----
    public List<Member> GetAllMembers()
    {
        var members = new List<Member>();
        using (SqlConnection con = new SqlConnection(connectionString))
        {
            SqlCommand cmd = new SqlCommand("SELECT * FROM Members", con);
            con.Open();
            SqlDataReader reader = cmd.ExecuteReader();
            while (reader.Read())
            {
                members.Add(new Member
                {
                    Id = (int)reader["Id"],
                    Name = reader["Name"].ToString(),
                    Role = reader["Role"].ToString(),
                    PhotoPath = reader["PhotoPath"].ToString()
                });
            }
        }
        return members;
    }

    public void AddMember(Member member)
    {
        using (SqlConnection con = new SqlConnection(connectionString))
        {
            SqlCommand cmd = new SqlCommand(
                "INSERT INTO Members (Name, Role, PhotoPath) VALUES (@Name, @Role, @PhotoPath)", con);
            cmd.Parameters.AddWithValue("@Name", member.Name);
            cmd.Parameters.AddWithValue("@Role", member.Role);
            cmd.Parameters.AddWithValue("@PhotoPath", member.PhotoPath);
            con.Open();
            cmd.ExecuteNonQuery();
        }
    }

    public void DeleteMember(int id)
    {
        using (SqlConnection con = new SqlConnection(connectionString))
        {
            SqlCommand cmd = new SqlCommand("DELETE FROM Members WHERE Id = @Id", con);
            cmd.Parameters.AddWithValue("@Id", id);
            con.Open();
            cmd.ExecuteNonQuery();
        }
    }

    // ---- GALLERY ----
    public List<GalleryPhoto> GetAllPhotos()
    {
        var photos = new List<GalleryPhoto>();
        using (SqlConnection con = new SqlConnection(connectionString))
        {
            SqlCommand cmd = new SqlCommand("SELECT * FROM GalleryPhotos", con);
            con.Open();
            SqlDataReader reader = cmd.ExecuteReader();
            while (reader.Read())
            {
                photos.Add(new GalleryPhoto
                {
                    Id = (int)reader["Id"],
                    ImagePath = reader["ImagePath"].ToString(),
                    Caption = reader["Caption"].ToString()
                });
            }
        }
        return photos;
    }

    public void AddPhoto(GalleryPhoto photo)
    {
        using (SqlConnection con = new SqlConnection(connectionString))
        {
            SqlCommand cmd = new SqlCommand(
                "INSERT INTO GalleryPhotos (ImagePath, Caption) VALUES (@ImagePath, @Caption)", con);
            cmd.Parameters.AddWithValue("@ImagePath", photo.ImagePath);
            cmd.Parameters.AddWithValue("@Caption", photo.Caption);
            con.Open();
            cmd.ExecuteNonQuery();
        }
    }

    public void DeletePhoto(int id)
    {
        using (SqlConnection con = new SqlConnection(connectionString))
        {
            SqlCommand cmd = new SqlCommand("DELETE FROM GalleryPhotos WHERE Id = @Id", con);
            cmd.Parameters.AddWithValue("@Id", id);
            con.Open();
            cmd.ExecuteNonQuery();
        }
    }

    // ---- ACTIVITIES ----
    public List<Activity> GetAllActivities()
    {
        var activities = new List<Activity>();
        using (SqlConnection con = new SqlConnection(connectionString))
        {
            SqlCommand cmd = new SqlCommand("SELECT * FROM Activities", con);
            con.Open();
            SqlDataReader reader = cmd.ExecuteReader();
            while (reader.Read())
            {
                activities.Add(new Activity
                {
                    Id = (int)reader["Id"],
                    Title = reader["Title"].ToString(),
                    Description = reader["Description"].ToString(),
                    PhotoPath = reader["PhotoPath"].ToString()
                });
            }
        }
        return activities;
    }

    public void AddActivity(Activity activity)
    {
        using (SqlConnection con = new SqlConnection(connectionString))
        {
            SqlCommand cmd = new SqlCommand(
                "INSERT INTO Activities (Title, Description, PhotoPath) VALUES (@Title, @Description, @PhotoPath)", con);
            cmd.Parameters.AddWithValue("@Title", activity.Title);
            cmd.Parameters.AddWithValue("@Description", activity.Description);
            cmd.Parameters.AddWithValue("@PhotoPath", activity.PhotoPath);
            con.Open();
            cmd.ExecuteNonQuery();
        }
    }

    public void DeleteActivity(int id)
    {
        using (SqlConnection con = new SqlConnection(connectionString))
        {
            SqlCommand cmd = new SqlCommand("DELETE FROM Activities WHERE Id = @Id", con);
            cmd.Parameters.AddWithValue("@Id", id);
            con.Open();
            cmd.ExecuteNonQuery();
        }
    }

    // ---- JOIN REQUESTS ----
    public static void AddJoinRequest(string fullName, string email, string phone, string department, string reason)
    {
        string connectionString = ConfigurationManager
            .ConnectionStrings["MyDbConnection"].ConnectionString;

        using (SqlConnection con = new SqlConnection(connectionString))
        {
            SqlCommand cmd = new SqlCommand(
                "INSERT INTO JoinRequests (FullName, Email, Phone, Department, Reason, RequestDate, Status) " +
                "VALUES (@FullName, @Email, @Phone, @Department, @Reason, @RequestDate, @Status)", con);
            cmd.Parameters.AddWithValue("@FullName", fullName);
            cmd.Parameters.AddWithValue("@Email", email);
            cmd.Parameters.AddWithValue("@Phone", phone);
            cmd.Parameters.AddWithValue("@Department", department);
            cmd.Parameters.AddWithValue("@Reason", reason);
            cmd.Parameters.AddWithValue("@RequestDate", DateTime.Now);
            cmd.Parameters.AddWithValue("@Status", "Pending");
            con.Open();
            cmd.ExecuteNonQuery();
        }
    }

    public List<JoinRequestModel> GetAllJoinRequests()
    {
        var requests = new List<JoinRequestModel>();
        using (SqlConnection con = new SqlConnection(connectionString))
        {
            SqlCommand cmd = new SqlCommand("SELECT * FROM JoinRequests ORDER BY RequestDate DESC", con);
            con.Open();
            SqlDataReader reader = cmd.ExecuteReader();
            while (reader.Read())
            {
                requests.Add(new JoinRequestModel
                {
                    Id = (int)reader["Id"],
                    FullName = reader["FullName"].ToString(),
                    Email = reader["Email"].ToString(),
                    Phone = reader["Phone"].ToString(),
                    Department = reader["Department"].ToString(),
                    Reason = reader["Reason"].ToString(),
                    RequestDate = (DateTime)reader["RequestDate"],
                    Status = reader["Status"].ToString()
                });
            }
        }
        return requests;
    }

    public void UpdateJoinRequestStatus(int id, string status)
    {
        using (SqlConnection con = new SqlConnection(connectionString))
        {
            con.Open();

            // Update status
            SqlCommand cmd = new SqlCommand(
                "UPDATE JoinRequests SET Status = @Status WHERE Id = @Id", con);
            cmd.Parameters.AddWithValue("@Status", status);
            cmd.Parameters.AddWithValue("@Id", id);
            cmd.ExecuteNonQuery();

            // If approved, add to Members table
            if (status == "Approved")
            {
                SqlCommand insertCmd = new SqlCommand(
                    "INSERT INTO Members (Name, Role, PhotoPath) " +
                    "SELECT FullName, Department, '' FROM JoinRequests WHERE Id = @Id", con);
                insertCmd.Parameters.AddWithValue("@Id", id);
                insertCmd.ExecuteNonQuery();
            }
        }
    }

    public void DeleteJoinRequest(int id)
    {
        using (SqlConnection con = new SqlConnection(connectionString))
        {
            SqlCommand cmd = new SqlCommand("DELETE FROM JoinRequests WHERE Id = @Id", con);
            cmd.Parameters.AddWithValue("@Id", id);
            con.Open();
            cmd.ExecuteNonQuery();
        }
    }

    public void UpdateMemberRole(int id, string role)
    {
        using (SqlConnection con = new SqlConnection(connectionString))
        {
            SqlCommand cmd = new SqlCommand(
                "UPDATE Members SET Role = @Role WHERE Id = @Id", con);
            cmd.Parameters.AddWithValue("@Role", role);
            cmd.Parameters.AddWithValue("@Id", id);
            con.Open();
            cmd.ExecuteNonQuery();
        }
    }
}