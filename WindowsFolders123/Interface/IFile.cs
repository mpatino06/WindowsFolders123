using System;
using System.Collections.Generic;
using System.Text;
using System.Threading.Tasks;
using WindowsFolders123.Core.Models;

namespace WindowsFolders123.Core.Interface
{
	public interface IFile
	{
		Task<int> AddFiles(Files files);
		Task<List<Files>> GetFilesFromFolder(int Id);
	}
}
