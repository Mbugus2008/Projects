using System;
using System.IO;
using System.Net;
using System.Text;
using System.Data;
using System.IO.Ports;
using System.Threading;
using System.Net.Sockets;
using System.Collections.Generic;
using System.Security.Cryptography;
using System.Diagnostics;
using System.Net.Mail;

using SQL_DB = System.Data.SqlClient;

namespace Server
{
    sealed class Program
    {
        static void Main(string[] args)
        {
            try
            {
                                Console.Title = "[Copyright TrimLine " + DateTime.Now.Year +" © Sacco Link Bridge®]";
            }
            catch (Exception vError)
            {
                vError.Data.Clear();
            }

            while (true)
            {
                try
                {
                    Database.Ip = "AFYACOOP20";
                    Database.instance = "MSSQLSERVER2014";
                    Database.Db = "AFYADB";
                    Database.user = "atm";
                    Database.password = "123456789**++";

                    //test

                   

                    Connection.Ipaddress = "172.18.100.6";
                    //Connection.Ipaddress = "127.0.0.1";
                   Connection.localIpaddress = "172.17.162.243";
                    //Connection.localIpaddress = "127.0.0.1";

                    Connection.portNumber = 25901;
                    Connection.company = "NEW AFYA SACCO LTD";
                   
                    new Connection();
                    
                }
                catch (Exception vError)
                {
                    Console.ForegroundColor = ConsoleColor.Red;
                    Console.Beep(2000, 2000);
                    vError.Data.Clear();
                }
            }
        }
    }

}
