using System;
using System.Collections.Generic;
using System.Text;
using System.Threading.Tasks;
using WindowsFolders123.Core.Models;

namespace WindowsFolders123.Core.Interface
{
	public interface IFolder
	{
		Task<int> AddFolder(Folder folder);
		Task<List<Folder>> GetSubFoldersFromFolders(int Id);
		Task<List<Folder>> GetFolders();
		Task<Folder> GetFolderById(int Id);
	}
}
