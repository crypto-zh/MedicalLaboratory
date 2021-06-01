using System;
using System.Linq;
using MedicalLaboratory.Data.BaseModel;
using Microsoft.VisualStudio.TestTools.UnitTesting;

namespace UnitTest
{
    [TestClass]
    public class EFTest
    {
        [TestMethod]
        public void InsertTest()
        {
            Post newPost = new Post();
            newPost.Title = "Интеграционное тестирование";
            Post resultPost = new Post();
            try
            {
                MedicalLaboratoryEntities.getContext().Post.Add(newPost);
                MedicalLaboratoryEntities.getContext().SaveChanges();
                resultPost = MedicalLaboratoryEntities.getContext().Post.OrderByDescending(p=>p.).FirstOrDefault();
            }
            catch (Exception ex)
            {
                Console.WriteLine(ex.Message);
            }
            finally
            {
                Assert.AreEqual(newPost.Title, resultPost.Title);
                if (newPost == resultPost)
                {
                    try
                    {
                        MedicalLaboratoryEntities.getContext().Post.Remove(resultPost);
                        MedicalLaboratoryEntities.getContext().SaveChanges();
                    }
                    catch (Exception ex)
                    {
                        Console.WriteLine(ex.Message);
                    }
                }
            }
            
            
        }
    }
}
