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
        private SqlConnection conn = new SqlConnection("Server=LAPTOP-FPSD9HOC;Database=Comp229Assign03;Integrated Security=True;");
        protected void Page_Load(object sender, EventArgs e)
        {

            if (!IsPostBack)
            {
                ShowStudentsName();
            }
           
        }

        public void ShowStudentsName()
        {
            
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
        protected void btnDone_Click(object sender, EventArgs e)
        {
            SqlCommand InsertName = new SqlCommand("INSERT INTO Comp229Assign03.[dbo].Students ( FirstMidName, LastName, EnrollmentDate) VALUES(@FirstName, @LastName, @EnrollmentDate); ", conn);

            //LabelFirstName.Text = "Test";
            InsertName.Parameters.Add("@FirstName", System.Data.SqlDbType.VarChar);
            InsertName.Parameters["@FirstName"].Value = BoxFName.Text;

            InsertName.Parameters.Add("@LastName", System.Data.SqlDbType.VarChar);
            InsertName.Parameters["@LastName"].Value = BoxLName.Text;

            InsertName.Parameters.Add("@EnrollmentDate", System.Data.SqlDbType.Date);
            InsertName.Parameters["@EnrollmentDate"].Value = DateTime.Now;


            try
            {
                conn.Open();
                InsertName.ExecuteNonQuery();

            }
            finally
            {
                conn.Close();
            }
            ShowStudentsName();

        }


    }
}