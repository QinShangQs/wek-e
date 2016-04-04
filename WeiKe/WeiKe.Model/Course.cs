using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace WeiKe.Model
{
    public class Course
    {
        public Course() 
        {
            items = new List<CourseItem>();
        }

        public int id { get;set; }
        public string title { get; set; }
        public int teacherId { get; set; }
        public string remark { get; set; }
        public string unionNumber { get; set; }
        public string grad { get; set; }
        public string categoryName { get; set; }
        public string addtime { get; set; }
        public string picture { get; set; }

        public Users teacher { get; set; }
        public IList<CourseItem> items { get; set; }
    }
}
