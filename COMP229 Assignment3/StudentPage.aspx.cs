using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace COMP229_Assignment3
{
    public partial class StudentPage : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            // Define data objects
            SqlConnection conn;
            SqlCommand comm;
            SqlDataReader reader;
            // Read the connection string from Web.config
            string connectionString = ConfigurationManager.ConnectionStrings["Students"].ConnectionString;
            // Initialize connection
            conn = new SqlConnection(connectionString);
            // Create command
            comm = new SqlCommand(
              "SELECT * FROM Students",
              conn);
            // Enclose database code in Try-Catch-Finally
            try
            {
                // Open the connection
                conn.Open();
                // Execute the command
                reader = comm.ExecuteReader();
                // Bind the reader to the DataList
                studentsList.DataSource = reader;
                studentsList.DataBind();

                // Close the reader
                reader.Close();
            }
            finally
            {
                // Close the connection
                conn.Close();
            }
        }
    }
}