using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;
using WindowsFolders123.Core.Interface;
using WindowsFolders123.Core.Models;

namespace WindowsFolders123.Web.Controllers
{
    public class FolderController : Controller
    {
		private readonly IFolder _folder;

		public FolderController(IFolder folder) => _folder = folder;
	
		public async Task<ActionResult> Index()
        {
			var result = await _folder.GetFolders();
            return View(result);
        }

		public ActionResult Add()
		{
			return PartialView("_Add", new Folder());
		}

		public ActionResult AddSubFolder()
		{
			return PartialView("_AddSubFolder", new Folder());
		}

		public async Task<ActionResult> Save(Folder model)
		{
			bool result = false;
			if (model != null)
			{
				result = await _folder.AddFolder(model) > 0 ? true : false;
			}
			return Json(result);
		}

		public async Task<ActionResult> Subfolder(int? id)
		{
			List<Folder> folder = new List<Folder>();
			if (id != null)
			{
				var folderName = await _folder.GetFolderById(Convert.ToInt32(id));
				folder = await _folder.GetSubFoldersFromFolders(Convert.ToInt32(id));

				ViewBag.FolderId = id.ToString();
				ViewBag.FolderName = folderName.PathFile.ToString();
			}
			else
				RedirectToAction("Index");
		
			return View(folder);
		}



    }
}