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
    public class FileController : Controller
    {


		private readonly IFile _files;

		public FileController(IFile files) => this._files = files;
		

		public async Task<ActionResult> Index(int? Id)
        {
			if (Id != null)
			{
				ViewBag.FolderId = Id.ToString();
				var result = await _files.GetFilesFromFolder(Convert.ToInt32(Id));
				return View(result);
			}
			else
				return RedirectToAction("Index", "Folder");
			
        }

		public ActionResult Add()
		{
			return PartialView("_Add", new Files());
		}

		public async Task<ActionResult> Save(Files model)
		{
			bool result = false;
			if (model != null)
			{

				result = await _files.AddFiles(model) > 0 ? true : false;

			}
			return Json(result);
		}



	}
}