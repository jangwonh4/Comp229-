using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.Configuration;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace COMP229_Assignment3
{
    public partial class CoursePage : System.Web.UI.Page
    {
        // Gets C229Wk06 connection string from the web.config file
        private SqlConnection connectionWebConfig = new SqlConnection(WebConfigurationManager.ConnectionStrings["Students"].ConnectionString);

        private SqlConnection connection = new SqlConnection("Server=LAPTOP-FPSD9HOC;Initial Catalog=Comp229Assign03;Integrated Security=True");

        protected void Page_Load(object sender, EventArgs e)
        {
            // Only build the list on the initial arrival, not after button presses
            if (!IsPostBack)
            {
                OpenClass();
            }
        }

        private void OpenClass()
        {
            try
            {
                
                SqlCommand comm = new SqlCommand("Select * from Courses;", connection);
                connection.Open();
                SqlDataReader reader = comm.ExecuteReader();

                myRepeater.DataSource = reader;
                myRepeater.DataBind();

                //while (reader.Read())
                //{
                //    Label myLabel = new Label();
                //    myLabel.Text = reader["Title"].ToString();
                //    myPlaceHolder.Controls.Add(myLabel);
                //    myPlaceHolder.Controls.Add(new LiteralControl("<br/>"));
                //}
                //connection.Close();
            }
            finally
            {
                connection.Close();
            }
        }

        protected void myRepeater_ItemCommand(object source, RepeaterCommandEventArgs e)
        {
            // try-finally to ensure that the connection is closed if there's an issue
            try
            {
                if (e.CommandName == "deleteCommand")
                {
                    // You can't delete a record with references in other tables, so delete those references first
                    SqlCommand deleteEnrollments = new SqlCommand("DELETE FROM Enrollments WHERE CourseID=@CourseID", connection);
                    SqlCommand deleteCourse = new SqlCommand("DELETE FROM Courses WHERE CourseID=@CourseID", connection);

                    // Parameterize everything, even if the user isn't entering the values
                    deleteEnrollments.Parameters.AddWithValue("@CourseID", e.CommandArgument);
                    deleteCourse.Parameters.AddWithValue("@CourseID", e.CommandArgument);

                    connection.Open(); // open the cmd connection

                    // delete the references FIRST
                    deleteEnrollments.ExecuteNonQuery();
                    deleteCourse.ExecuteNonQuery();
                }
                else if (e.CommandName == "updateCommand")
                {
                    SqlCommand cmd = new SqlCommand("UPDATE Courses SET Title=@UpdatedTitle WHERE Title=@Title", connection);
                    cmd.Parameters.AddWithValue("@Title", e.CommandArgument);
                    cmd.Parameters.AddWithValue("@UpdatedTitle", e.CommandArgument + " - Updated");

                    connection.Open(); // open the cmd connection

                    cmd.ExecuteNonQuery();
                }
            }
            finally
            {
                connection.Close();
            }

            // Re-bind the data with the changed database records
            OpenClass();
        }
    }
}