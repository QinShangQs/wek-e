using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using WeiKe.Model;
using WeiKe.Repository;

namespace WeiKe.Service
{
    public class CourseItemService
    {
        public static bool Create(CourseItem inst)
        {
            return CourseItemRepository.Add(inst) > 0;
        }

        public static bool Edit(CourseItem inst)
        {
            return CourseItemRepository.Update(inst) > 0;
        }

        public static bool Remove(int id)
        {
            return CourseItemRepository.Delete(id) > 0;
        }

        public static CourseItem GetById(int id)
        {
            return CourseItemRepository.GetById(id);
        }

        public static IList<CourseItem> RetrievesAll()
        {
            return CourseItemRepository.FindAll();
        }

        public static IList<CourseItem> RetrievesByCourse(int courseId)
        {
            return CourseItemRepository.FindByCourseId(courseId);
        }
    }
}
