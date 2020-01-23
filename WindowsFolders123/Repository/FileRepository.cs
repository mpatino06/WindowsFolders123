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
	public class FileRepository : IFile
	{
		public async Task<int> AddFiles(Files files)
		{
			try
			{
				using (var context = new DBDataIfxContext())
				{
					context.Files.Add(files);
					await context.SaveChangesAsync();
					return files.Id;
				}
			}
			catch (Exception)
			{
				return -1;
			}
		}

		public async Task<List<Files>> GetFilesFromFolder(int Id)
		{
			try
			{
				using (var context = new DBDataIfxContext())
				{
					return await context.Files.Where(a => a.FolderId == Id).ToListAsync();
				}
			}
			catch (Exception)
			{
				return null;
			}
		}

	}
}
