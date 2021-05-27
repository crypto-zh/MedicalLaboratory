using System;
using Microsoft.VisualStudio.TestTools.UnitTesting;

namespace UnitTest
{
    [TestClass]
    public class HashTest
    {
        [TestMethod]
        public void PositiveTest()
        {
            string testData = "manager";
            string result = "1D0258C2440A8D19E716292B231E3190";
            string answer = PasswordEncryption.PasswordEncryption.createMD5(testData);
            Assert.AreEqual(result, answer);
        }
        [TestMethod]
        public void NegativeTest()
        {
            string testData = "!manager@23%";
            string result = "6B8F8E475DA08B285904E89CBC86DD5D";
            string answer = PasswordEncryption.PasswordEncryption.createMD5(testData);
            Assert.AreEqual(result, answer);
        }
    }
}
