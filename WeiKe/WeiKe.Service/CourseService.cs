using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using WeiKe.Model;
using WeiKe.Repository;

namespace WeiKe.Service
{
    public class CourseService
    {
        public static bool Create(Course inst, ref string message, ref int newId) 
        {
            bool success = false;
            try
            {
                newId = CourseRepository.Add(inst);
                if (newId > 0)
                {
                    success = true;
                    message = "添加成功！";
                }
                else 
                {
                    message = "添加失败！";
                }
            }
            catch (Exception e)
            {
                message = e.Message;
            }
            return success;
        }

        public static bool Edit(Course inst) 
        {
            return CourseRepository.Update(inst) > 0;
        }

        public static bool Remove(int id) 
        {
            Course course = CourseRepository.GetById(id);
            foreach (var item in course.items) 
            {
                CourseItemRepository.Delete(item.id);
            }

            return CourseRepository.Delete(id) > 0;
        }

        public static Course GetById(int id) 
        {
            return CourseRepository.GetById(id);
        }

        public static IList<Course> RetrievesAll() 
        {
            return CourseRepository.FindAll();
        }

        public static IList<Course> RetrievesByTeacher(int teacherId)
        {
            return CourseRepository.FindByTeacherId(teacherId);
        }
    }
}
