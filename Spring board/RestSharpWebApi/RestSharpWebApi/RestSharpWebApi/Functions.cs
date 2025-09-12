using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace RestSharpWebApi
{
    public class Functions
    {
        public int getRandomNumber()
        {
            Random rand = new Random();
            int min = 1001;
            int max = 9998;
            int randomNum = rand.Next(min, max + 1);
            //Console.WriteLine(randomNum);
            return randomNum;

        }
    }

    //public class LoanWithMore extends LoanListMobile
    //{

    //}
}