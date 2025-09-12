// See https://aka.ms/new-console-template for more information
using nyala;
using System.Collections.Generic;
using Xunit;

Console.WriteLine("Hello, World!");
//new test().tests();
char space = ' ';
//string ops = Console.ReadLine();
//List<int> ops2 = new List<int>();
//for (int i = 0; i < ops.Length; i++)
//{
//    int n;
//    int.TryParse(ops[i], out n);
//    if (n != 0)
//        ops2.Add(Convert.ToInt32( ops[i]));
//    if (ops[i].ToString().Equals("C") && ops2.Count()>0)
//        ops2.Remove(ops2[ ops2.Count() - 1]);
//    if (ops[i].ToString().Equals("D") && ops2.Count() >1)
//        ops2.Add((Convert.ToInt32( ops2[ops2.Count() - 1]) * 2));
//   if (ops[i].ToString().Equals("+") && ops2.Count()>1)
//        ops2.Add((Convert.ToInt32( ops2[ops2.Count() - 1]) + Convert.ToInt32(ops2[ops2.Count() - 2])));

//}
//double d= ops2.Sum(o=> Convert.ToDouble(o));

//char[] characters = ops.ToCharArray();
//bool okk = true;
//	for (int i = 0; i < characters.Length; i++)
//	{
//    if ((i % 2 == 0))
//        if (characters.Length == i + 1)
//        {
//            if (ok(characters[i], ' ' ) == false)
//                okk = false;
//        }
//    else
//    if (ok(characters[i], characters[i + 1]) == false)
//        okk = false;
//}
//(-1, 3)   (3, 1)   (0, -1)   (-2, 1)
//(-1, 3)   (1, 2)   (3, 1)   (1, 1)   (0, -1)   (-2, 1)  (-1, 2)
List<Point> points = new List<Point>();
points.Add(new Point(-1, 3));
points.Add(new Point(1, 2));

points.Add(new Point(3, 1));
points.Add(new Point(1, 1));
points.Add(new Point(0, -1));
points.Add(new Point(-2, 1));
points.Add(new Point(-1, 2));

//Console.WriteLine(new Codilit().cars( new int[] { 2,3,4,2},new int[] {2,5,7,2 } ));
//new PasswordValidatorUnitTests().SampleTest();
//Console.WriteLine();
codebyte.HistogramArea();                            


 //Console.WriteLine(findd("abced","cdfabe"));

 char  findd(String s, string t)
{
    char[] ss = s.ToCharArray();
    char[] tt = t.ToCharArray();
    foreach (char item in tt)
    {
        var dd = ss.FirstOrDefault(o => o.Equals(item));
        if (dd == 0)
           
        return item;
    }
    return ' ';

}


//Console.WriteLine(Pairs(ops.Split(new char[] {' '})));

bool ok(char character1, char character2) {
    if (character1 == '(' && character2 == ')')
        return true;
    else if (character1 == '{' && character2 == '}')
        return true;
    else if (character1 == '[' && character2 == ']')
        return true;
    else
        return false;
}

int countingvalleys(String path)

{
    List<int> lines = new List<int>();
    int d =0, up=0, tups=0, down = 0, tdowns = 0;
    char[] p = path.ToCharArray();
    foreach (char c in p)
    { if (c == 'U')
        {
            d += 1;
            
        }
        else
            d += -1;
        lines.Add(d);
       // Console.WriteLine(d);
    }

    foreach (var item in lines)
    {
        if ((item > 0) && (up == 0))
        {
            tups+=1;
            up = 1;
            down = 0;

        }
        if ((item < 0) && (down == 0))
        {
            tdowns += 1;
            up = 0;
            down = 1;

        }
        if ((item == 0) )
        {
           
            up = 0;
            down = 0;

        }
    }
    return tdowns;
}

int Pairs(string[] ar) {

    int tto = 0;
    List<pair> pairs = new List<pair>();
    foreach (var item in ar)
    {
        if (pairs.FirstOrDefault(o => o.key == item) == null)
        {
            pairs.Add(new pair() { key = item, count = 1 });
        }
        else
            pairs.FirstOrDefault(o => o.key == item).count += 1;
    }

    foreach (var item in pairs)
    {
     
        item.pairs =(int) Math.Floor( (double)(item.count / 2));
    }
    tto = pairs.Sum(o => o.pairs);
    return tto;
}
class pair {public  string key { get; set; }
public int count { get; set; } 
public int pairs { get; set; }
}
class test {
   public void tests() {
        string baseURL = "http://desktop-fef2iq4:1913/Nyala/WS/NYALA%20VISION%20SACCO%20LTD/Page/";
        System.ServiceModel.BasicHttpBinding navWSBinding = new System.ServiceModel.BasicHttpBinding();
        navWSBinding.Security.Mode = System.ServiceModel.BasicHttpSecurityMode.TransportCredentialOnly;
        navWSBinding.Security.Transport.ClientCredentialType = System.ServiceModel.HttpClientCredentialType.Windows;

        // Create the SystemService Client

        Account_Entries_PortClient systemService = new Account_Entries_PortClient(navWSBinding, new System.ServiceModel.EndpointAddress(baseURL + "Account_Entries"));
        
        systemService.ClientCredentials.Windows.AllowedImpersonationLevel = System.Security.Principal.TokenImpersonationLevel.Delegation;
        systemService.ClientCredentials.Windows.AllowNtlm = true;

      var dd =  systemService.ReadMultiple(new Account_Entries_Filter[] { }, null, 0);




    } }

class Codilit
{
    public int solution(int N)
    {
        // Implement your solution here
        int r = 0;
        string binaryRepresentation = Convert.ToString(N, 2);

        string[] gaps = binaryRepresentation.Split(new Char[] { '1' });

        if (gaps.Length <= 2)
            return 0;

        foreach (string g in gaps)
        {
            if (g.Length > r)
                r = g.Length;
        }
        return r;
    }

    public int[] arrayshift(int[] A, int K)
    {
        int[] r = new int[A.Length];
        A.CopyTo(r, 0);
        for (int j = 0; j < K; j++)
        {
            for (int i = 0; i < A.Length; i++)
            {
                if (i == 0)
                    A[0] = r[r.Length - 1];
                else
                    A[i] = r[i - 1];
            }
            A.CopyTo(r, 0);

        }

        return A;
    }
    public int frog(int X, int Y, int D)
    {
        decimal d = (decimal)(Y - X) / D;
        return (int)Math.Ceiling(d);


    }


    public int sparse(int N)
    {
        for (int i = 1; i < N; i++)
        {
            int num2 = N - i;
            if (num2 > 0)
            {
                bool notsparse = Convert.ToString(i, 2).Contains("11");
                bool notsparse1 = Convert.ToString(num2, 2).Contains("11");
                if (!notsparse && !notsparse1)
                {
                    return i;
                }

            }
        }
        return -1;

    }

    public string transform(string s)
    {
        bool has = s.Contains("AA") || s.Contains("BB") || s.Contains("CC");
        while (has)
        {
            s = s.Replace("AA", "");
            s = s.Replace("BB", "");
            s = s.Replace("CC", "");

            has = s.Contains("AA") || s.Contains("BB") || s.Contains("CC");
        }
        return s;
    }
    public static bool IsConvex(Point[] points)
    {
        int n = points.Length;

        if (n < 3)
        {
            // A polygon with less than 3 points is not considered convex.
            return false;
        }

        int sign = 0; // 0 indicates no sign recorded yet.

        for (int i = 0; i < n; i++)
        {
            var d = 1 % 7;
            double dx1 = points[(i + 1) % n].X - points[i].X;
            double dy1 = points[(i + 1) % n].Y - points[i].Y;
            double dx2 = points[(i + 2) % n].X - points[(i + 1) % n].X;
            double dy2 = points[(i + 2) % n].Y - points[(i + 1) % n].Y;

            double crossProduct = dx1 * dy2 - dx2 * dy1;

            if (Math.Abs(crossProduct) > double.Epsilon)
            {
                if (sign == 0)
                {
                    sign = Math.Sign(crossProduct);
                }
                else if (sign != Math.Sign(crossProduct))
                {
                    return false; // The signs of cross products vary; the polygon is not convex.
                }
            }
        }

        return true; // All cross products had the same sign; the polygon is convex.
    }
    public int cars(int[] P, int[] S)
    {

        // P= [1,4,1] 
        // S = [1,5,1]
        List<int> t = new List<int>();
        int ppp = 0;
        foreach (var pp in P)
        {
            ppp += pp;
        }
        S = S.OrderByDescending(x => x).ToArray();
        for (int i = 0; i < S.Length; i++)
        {
            t.Add(S[i]);
            ppp -= S[i];
            if (ppp <= 0)
                break;
        }

        return t.Count;

    }
}
  


public class Point
{
    public double X { get; set; }
    public double Y { get; set; }

    public Point(double x, double y)
    {
        X = x;
        Y = y;
    }
}

public interface IPasswordValidator
{
    /// <summary>
    /// Initialize a password validator.
    /// </summary>
    ///
    /// <param name="minLength">The minimum length of the passowrd</param>
    /// <param name="maxLength">The maximum length of the passowrd</param>
    /// <param name="mustContainDigits"><c>true</c> - a password must contain at least 1 digit</param>
    /// <param name="mustContainCapitalLetters"><c>true</c> - a password must contain at least 1 capital letter</param>
    ///
    /// <exception cref="IndexOutOfRangeException">If minLength is lower than or equal to zero</exception>
    /// <exception cref="IndexOutOfRangeException">If maxLength is greater than 255</exception>
    /// <exception cref="ArgumentException">If minLength is greater than maxLength</exception>
    void Initialize(
        int minLength,
        int maxLength,
        bool mustContainDigits,
        bool mustContainCapitalLetters);

    /// <summary>
    /// Validates a provided password
    /// </summary>
    /// <param name="password">A password to validate</param>
    /// <returns>A validator result</returns>
    ValidationResult Validate(string password);
}



public class ValidationResult
{
    /// <summary>
    /// Returns <c>true</c> only if a password matches all the rules
    /// </summary>
    public bool IsCorrect { get; set; }

    /// <summary>
    /// If <c>IsCorrect</c> is <c>true</c> then this property returns an empty arrray.
    /// Otherwise it returns all found errors. Errors cannot be duplicated.
    /// This property must not be null.
    /// </summary>
    public ValidationErrorEnum[] Errors { get; set; }
}



public enum ValidationErrorEnum
{
    IsEmpty, // If a password is an empty string or null
    IsTooShort, // If the length of a password is < minLength
    IsTooLong, // If the length of a password is > maxLength
    DoesNotContainDigits,
    DoesNotContainCapitalLetters
}


public class codebyte

{
    public static void mainwindow()
    {
        string[] strArr = { "aaabaaddae", "aed" };
        string result = MinWindowSubstring(strArr);
        Console.WriteLine(result); // Output: "dae"
    }

    public static string MinWindowSubstring(string[] strArr)
    {
        string N = strArr[0];
        string K = strArr[1];

        if (string.IsNullOrEmpty(N) || string.IsNullOrEmpty(K) || K.Length > N.Length)
        {
            return "";
        }

        Dictionary<char, int> charCount = new Dictionary<char, int>();
        foreach (char c in K)
        {
            if (charCount.ContainsKey(c))
            {
                charCount[c]++;
            }
            else
            {
                charCount[c] = 1;
            }
        }

        int left = 0;
        int minLen = int.MaxValue;
        int minLeft = 0;
        int count = charCount.Count;

        for (int right = 0; right < N.Length; right++)
        {
            if (charCount.ContainsKey(N[right]))
            {
                charCount[N[right]]--;
                if (charCount[N[right]] == 0)
                {
                    count--;
                }
            }

            while (count == 0)
            {
                if (right - left + 1 < minLen)
                {
                    minLen = right - left + 1;
                    minLeft = left;
                }

                if (charCount.ContainsKey(N[left]))
                {
                    charCount[N[left]]++;
                    if (charCount[N[left]] > 0)
                    {
                        count++;
                    }
                }

                left++;
            }
        }

        return minLen == int.MaxValue ? "" : N.Substring(minLeft, minLen);
    }

    public static int HistogramArea()
    {
     List<int> list = new List<int>();
       

        // code goes here  
        int[] arr = new int[] { 5, 6, 7, 4, 1 };
        int n = arr.Length,marea = 0,tp,tarea;;
        Stack<int> stt = new Stack<int>();
     int i = 0;
        while (i < n)
        {
           
            if (stt.Count == 0 || arr[stt.Peek()] <= arr[i])
            {
                stt.Push(i++);
            }

            else
            {
                tp = stt.Peek(); 
                stt.Pop(); 

                tarea
                    = arr[tp]
                      * (stt.Count == 0 ? i
                                      : i - stt.Peek() - 1);


                if (marea < tarea)
                {
                    marea = tarea;
                }
            }
        }

      
        while (stt.Count > 0)
        {
            tp = stt.Peek();
            stt.Pop();
            tarea
                = arr[tp]
                  * (stt.Count == 0 ? i : i - stt.Peek() - 1);

            if (marea < tarea)
            {
                marea = tarea;
            }
        }

        return marea;

    }

}