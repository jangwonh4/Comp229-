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
           
            
        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            SqlConnection conn;
            SqlCommand comm;
            SqlDataReader reader;

            string connectionString = ConfigurationManager.ConnectionStrings["Students"].ConnectionString;

            conn = new SqlConnection(connectionString);

            comm = new SqlCommand(
              "SELECT * FROM Student",
              conn);

            try
            {

                conn.Open();

                reader = comm.ExecuteReader();

                studentsList.DataSource = reader;
                studentsList.DataBind();


                reader.Close();
            }
            finally
            {

                conn.Close();
            }
        }
    }
}