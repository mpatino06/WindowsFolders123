using System;
using System.Collections.Generic;

namespace WindowsFolders123.Core.Models
{
    public partial class Files
    {
        public int Id { get; set; }
        public string FileName { get; set; }
        public int FolderId { get; set; }

        public Folder Folder { get; set; }
    }
}
