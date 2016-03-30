using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace WeiKe.Model
{
    public class Category
    {
        public int id { get; set; }
        public string title { get; set; }
        public int parentId { get; set; }
    }
}
