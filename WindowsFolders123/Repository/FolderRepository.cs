using Microsoft.EntityFrameworkCore;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using WindowsFolders123.Core.Interface;
using WindowsFolders123.Core.Models;

namespace WindowsFolders123.Core.Repository
{
	public class FolderRepository : IFolder
	{
		public async Task<int> AddFolder(Folder folder)
		{
			try
			{
				using (var context = new DBDataIfxContext())
				{
					context.Folder.Add(folder);
					await context.SaveChangesAsync();
					return folder.Id;
				}
			}
			catch (Exception)
			{
				return -1;
			}
		}

		public async Task<List<Folder>> GetSubFoldersFromFolders(int Id)
		{
			try
			{
				using (var context = new DBDataIfxContext())
				{
					return await context.Folder.Where(a => a.IsSubFolder && a.Parent == Id).ToListAsync();
				}
			}
			catch (Exception)
			{
				return null;
			}
		}

		public async Task<List<Folder>> GetFolders()
		{
			try
			{
				using (var context = new DBDataIfxContext())
				{
					return await context.Folder.Where(a => a.IsSubFolder == false).ToListAsync();
				}
			}
			catch (Exception)
			{
				return null;
			}
		}

		public async Task<Folder> GetFolderById(int Id)
		{
			try
			{
				using (var context = new DBDataIfxContext())
				{
					return await context.Folder.FirstAsync(a => a.Id == Id);
				}
			}
			catch (Exception)
			{
				return null;
			}
		}

	}
}
