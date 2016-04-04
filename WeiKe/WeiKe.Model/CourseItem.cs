using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace WeiKe.Model
{
    public class CourseItem
    {
        public int id { get; set; }
        public int courseId { get; set; }
        public string title { get; set; }
        public string remark { get; set; }
        public string addtime { get; set; }
        public string filePath { get; set; }
    }
}
