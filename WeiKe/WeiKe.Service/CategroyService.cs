using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using WeiKe.Model;
using WeiKe.Repository;

namespace WeiKe.Service
{
    public class CategroyService
    {
        public static IList<Category> FindByParent(int parentId) 
        {
            return CategoryRepository.FindByParent(parentId);
        }
    }
}
