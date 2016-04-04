using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace WeiKe.Model
{
    public class Comments
    {
        public int id { get; set; }
        public string userName { get; set; }
        public int courseItemId { get; set; }
        public string content { get; set; }
        public string addtime { get; set; }
    }
}
