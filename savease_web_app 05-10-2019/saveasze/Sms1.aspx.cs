﻿using Microsoft.VisualBasic;
using System.Diagnostics;
using System.Data;
using System.Data.SqlClient;
using System.Net.Mail;
using System.Net;
using System.Threading;
//using System.Threading.Timer;
using System.IO;
using System.Text;
using System;
using System.Collections.Generic;
using System.Drawing;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace saveasze
{
    public partial class Sms1 : System.Web.UI.Page
    {
        connString constring = new connString();
        string ServerName;
        string ConString = "";
        string SQLConString = "";
        DataSet _dataset;
        protected void Page_Load(object sender, EventArgs e)
        {

        }
        public string _ConnectToApp()
        {
            //string constr = constring.connstring(connLocation);
            string constr = constring.connstring("");
            ConString = System.Configuration.ConfigurationManager.ConnectionStrings[constr].ConnectionString;
           // ConString = System.Configuration.ConfigurationManager.ConnectionStrings("ConnectToDataBanc").ConnectionString;
            return ConString;
        }
        public DataTable GetSMS()
        {
            DataTable _dataset = new DataTable();
            try { 
            using (SqlConnection con = new SqlConnection(_ConnectToApp()))
                {
                    using (SqlCommand cmd = new SqlCommand("select q.*, u.username, u.password, u.userid from queue q inner join users u on q.userid = u.userid where upper(status) <> 'SUBMITTED'", con))
                    {
                        cmd.CommandType = CommandType.Text;
                        using (SqlDataAdapter sda = new SqlDataAdapter(cmd))
                        {
                            sda.Fill(_dataset);
                        }
                    }
                }
            }
            catch(Exception ex)
            {

            }
            return _dataset;
        }
        public DataTable getUser()
        {

            DataTable _dataset = new DataTable();
            try
            {
                using (SqlConnection con = new SqlConnection(_ConnectToApp()))
                {
                    using (SqlCommand cmd = new SqlCommand("select top 1 * from users", con))
                    {
                        cmd.CommandType = CommandType.Text;
                        using (SqlDataAdapter sda = new SqlDataAdapter(cmd))
                        {
                            sda.Fill(_dataset);
                        }
                    }
                }
            }
            catch (Exception ex)
            {

            }
            return _dataset;
        }
        public DataTable GetPendingSMS()
        {

            DataTable _dataset = new DataTable();
            try
            {
                using (SqlConnection con = new SqlConnection(_ConnectToApp()))
                {
                    using (SqlCommand cmd = new SqlCommand("select q.*,u.username,u.password from queue q inner join users u on q.userid=u.userid where upper(status) <>'SUBMITTED'", con))
                    {
                        cmd.CommandType = CommandType.Text;
                        using (SqlDataAdapter sda = new SqlDataAdapter(cmd))
                        {
                            sda.Fill(_dataset);
                        }
                    }
                }
            }
            catch (Exception ex)
            {

            }
            return _dataset;
        }
        public DataTable GetBirthDayCelebrants()
        {

            DataTable _dataset = new DataTable();
            try
            {
                using (SqlConnection con = new SqlConnection(_ConnectToApp()))
                {
                    using (SqlCommand cmd = new SqlCommand("select customerid,CustFirstName,CustLastName,DOB ,PhoneNo from customer where SmsBirthDaySent=0 and day(dob)=day(getdate()) and month(dob)=month(getdate()) order by dob,customerid", con))
                    {
                        cmd.CommandType = CommandType.Text;
                        using (SqlDataAdapter sda = new SqlDataAdapter(cmd))
                        {
                            sda.Fill(_dataset);
                        }
                    }
                }
            }
            catch (Exception ex)
            {

            }
            return _dataset;
        }
        public DataTable GetOptionsSettings()
        {

            DataTable _dataset = new DataTable();
            try
            {
                using (SqlConnection con = new SqlConnection(_ConnectToApp()))
                {
                    using (SqlCommand cmd = new SqlCommand("select * from options", con))
                    {
                        cmd.CommandType = CommandType.Text;
                        using (SqlDataAdapter sda = new SqlDataAdapter(cmd))
                        {
                            sda.Fill(_dataset);
                        }
                    }
                }
            }
            catch (Exception ex)
            {

            }
            return _dataset;
        }
        public DataTable UpdateSMS(string id, string statusID, string status, string contents)
        {
            DataTable _dataset = new DataTable();
            try
            {
                using (SqlConnection con = new SqlConnection(_ConnectToApp()))
                {
                    using (SqlCommand cmd = new SqlCommand("update queue set status='" + status + "' , StatusID='" + statusID + "' ,content='" + contents + "' where id='" + id + "'", con))
                    {
                        cmd.CommandType = CommandType.Text;
                        using (SqlDataAdapter sda = new SqlDataAdapter(cmd))
                        {
                            sda.Fill(_dataset);
                        }
                    }
                }
            }
            catch (Exception ex)
            {

            }
            return _dataset;
        }
        public DataTable UpdateBirthDaySMS(string id, string smsQuery)
        {
            DataTable _dataset = new DataTable();
            try
            {
                using (SqlConnection con = new SqlConnection(_ConnectToApp()))
                {
                    using (SqlCommand cmd = new SqlCommand("update customer set SmsBirthDaySent=1 where customerid='" + id + "' ", con))
                    {
                        cmd.CommandType = CommandType.Text;
                        using (SqlDataAdapter sda = new SqlDataAdapter(cmd))
                        {
                            sda.Fill(_dataset);
                        }
                    }
                }
            }
            catch (Exception ex)
            {

            }
            return _dataset;
        }
        public DataTable UpdateUser(string id, string Balance)
        {
            DataTable _dataset = new DataTable();
            try
            {
                using (SqlConnection con = new SqlConnection(_ConnectToApp()))
                {
                    using (SqlCommand cmd = new SqlCommand("update users set credits='" + Balance + "' where userid=" + id, con))
                    {
                        cmd.CommandType = CommandType.Text;
                        using (SqlDataAdapter sda = new SqlDataAdapter(cmd))
                        {
                            sda.Fill(_dataset);
                        }
                    }
                }
            }
            catch (Exception ex)
            {

            }
            return _dataset;
        }

    }
}