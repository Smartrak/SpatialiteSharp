using System;
using System.Data.SQLite;
using System.IO;
using System.Reflection;

namespace SpatialiteSharp
{
	/// <summary>
	/// Provides a method to load spatialite into a given connection
	/// </summary>
	public class SpatialiteLoader
	{
		private static readonly object Lock = new object();
		
		private static bool _haveSetPath;

		/// <summary>
		/// Loads mod_spatialite.dll on the given connection
		/// </summary>
		public static void Load(SQLiteConnection conn)
		{
			lock (Lock)
			{
				//Need to work out where the file is and add it to the path so it can load all the other dlls too
				if (!_haveSetPath)
				{
					var spatialitePath = Path.Combine(Path.GetDirectoryName(Assembly.GetExecutingAssembly().Location), (Environment.Is64BitProcess ? "x64" : "x86"), "spatialite");
					
					Environment.SetEnvironmentVariable("PATH", Environment.GetEnvironmentVariable("PATH") + ";" + spatialitePath);

					_haveSetPath = true;
				}
			}

			conn.LoadExtension("mod_spatialite.dll");
		}
	}
}
