using System;

namespace Recursividad
{
	class Program
	{
		public static void Main(string[] args)
		{
			Write(0);
			Console.ReadLine();
		}
		public static void Write(int num)
		{
			num += 1;
			Console.WriteLine("num: " + num);
			if (num < 100)
				Write(num);
		}
	}
}
