// See https://aka.ms/new-console-template for more information
using System;


//int[] nums = new int[] { 2, 11, 7, 15 };
//int target = 9;
//int[] result = TwoSum(nums, target);
//Console.WriteLine("[{0}, {1}]", result[0], result[1]);  // Output: [0, 2]


//int[] fib = Fibonacci(10);
//foreach (int num in fib)
//{
//    Console.Write(num + " ");  // Output: 0 1 1 2 3 5 8 13 21 34
//}
//Console.WriteLine(IsPrime(1)); // False
//Console.WriteLine(IsPrime(2)); // True
//Console.WriteLine(IsPrime(3)); // True
//Console.WriteLine(IsPrime(4)); // False
//Console.WriteLine(IsPrime(5)); // True
Console.WriteLine(IsPalindrome("Paulo")); // True

int[] TwoSum(int[] nums, int target)
{
    // create a hash table to store each element along with its index
    Dictionary<int, int> numDict = new Dictionary<int, int>();
    for (int i = 0; i < nums.Length; i++)
    {
        numDict[nums[i]] = i;
    }

    // check for each element if its complement is already in the hash table
    for (int i = 0; i < nums.Length; i++)
    {
        int complement = target - nums[i];
        if (numDict.ContainsKey(complement) && numDict[complement] != i)
        {
            return new int[] { i, numDict[complement] };
        }
    }

    // if no such pair is found, return an empty array
    return new int[0];
}

 static int[] Fibonacci(int length)
{
    if (length <= 0)
    {
        return new int[0];  // return empty array for non-positive length
    }

    int[] fib = new int[length];
    fib[0] = 0;  // first number in the sequence
    if (length > 1)
    {
        fib[1] = 1;  // second number in the sequence
        for (int i = 2; i < length; i++)
        {
            fib[i] = fib[i - 1] + fib[i - 2];  // compute next number in the sequence
        }
    }

    return fib;
}
 static bool IsPrime(int num)
{
    if (num <= 1)
    {
        return false; // 1 is not a prime number
    }
    else if (num == 2)
    {
        return true; // 2 is a prime number
    }
    else
    {
        // Check if num is divisible by any number from 2 to num-1
        for (int i = 2; i < num; i++)
        {
            if (num % i == 0)
            {
                return false; // num is not a prime number
            }
        }
        return true; // num is a prime number
    }
}

 bool IsPalindrome(string input)
{
    string reversed = "";
    for (int i = input.Length - 1; i >= 0; i--)
    {
        reversed += input[i];
    }
    return input == reversed;
}

