using System;
using System.Collections.Generic;

namespace WindowsFolders123.Core.Models
{
    public partial class Folder
    {
        public Folder()
        {
            Files = new HashSet<Files>();
        }

        public int Id { get; set; }
        public string PathFile { get; set; }
        public bool IsSubFolder { get; set; }
		public int? Parent { get; set; }
        public ICollection<Files> Files { get; set; }
    }
}
