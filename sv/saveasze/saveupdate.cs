using MySql.Data.MySqlClient;
using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Text;

namespace saveasze
{
    class saveupdate
    {
        connString constring = new connString();

        public Int32 saveuserz(string in_username, string in_password, string in_email, string in_createdBy, string in_userlvl, string connLocation,out string expMessage)
        {
            Int32 resultz = 0;
            DataTable dt = new DataTable();
            string constr = constring.connstring(connLocation);
            string proc = "insertUser";
            Int32 intRecord = 0;
            try
            {

                using (MySqlConnection con = new MySqlConnection(constr))
                {
                    using (MySqlCommand cmd = new MySqlCommand(proc, con))
                    {
                        cmd.CommandType = CommandType.StoredProcedure;

                        cmd.Parameters.AddWithValue("@in_username", in_username);
                        cmd.Parameters.AddWithValue("@in_password", in_password);
                        cmd.Parameters.AddWithValue("@in_email", in_email);
                        cmd.Parameters.AddWithValue("@in_createdBy", in_createdBy);
                        cmd.Parameters.AddWithValue("@in_userlvl", Int32.Parse(in_userlvl));
                        con.Open();
                        cmd.ExecuteNonQuery();
                        con.Close();
                        //cmd.ExecuteNonQuery();
                       /* using (MySqlDataAdapter sda = new MySqlDataAdapter(cmd))
                        {
                            sda.Fill(dt);
                            resultz = 1;
                        }*/
                    }
                }
                expMessage = "";
            }
            catch (Exception exp)
            {
                expMessage = exp.Message;
            }
            if (dt.Rows.Count < 1)
                return 1;
            else
                return 0;
        }
    }
}
