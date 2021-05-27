using MedicalLaboratory.Data.BaseModel;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Windows;
using System.Windows.Controls;
namespace MedicalLaboratory.Views.Windows
{
    /// <summary>
    /// Логика взаимодействия для AddEditUserWindow.xaml
    /// </summary>
    public partial class AddEditUserWindow : Window
    {
        private static User currentUser;
        private Dictionary<int, string> comboData = new Dictionary<int, string>();
        private Page parrentPage;
        public AddEditUserWindow(User user, Page page)
        {
            InitializeComponent();
            currentUser = new User();
            parrentPage = page;
            this.Title = "Добавление пользователя";
            try
            {
                foreach (Employee employee in MedicalLaboratoryEntities.getContext().Employee.ToList())
                {
                    comboData.Add(employee.Id, employee.LastName + " " + employee.FirstName.First() + ". " + employee.Patronymic.First() + ". (" + employee.Post.Title + ")");
                }
                comboEmployee.ItemsSource = comboData.Values;
            }
            catch
            {
                MessageBox.Show("Ошибка в получении данных", "Ошибка", MessageBoxButton.OK, MessageBoxImage.Error);
            }
            
            if (user != null)
            {
                currentUser = user;
                this.Title = "Редактирование пользователя";
                string value = "";
                if (comboData.TryGetValue(currentUser.EmployeeId, out value))
                {
                    comboEmployee.SelectedItem = value;
                }
                btnResetPassword.IsEnabled = true;
            }
            DataContext = currentUser;
        }

        private void btnResetPassword_Click(object sender, RoutedEventArgs e)
        {
            currentUser.Password = "123456";
            MessageBox.Show("Пароль успешно сброшен! Пароль по умолчанию - 123456. Не забудьте сохранить изменения", "Информация", MessageBoxButton.OK, MessageBoxImage.Information);
        }

        private void btnSave_Click(object sender, RoutedEventArgs e)
        {
            StringBuilder stringBuilder = new StringBuilder();
            if (String.IsNullOrEmpty(currentUser.Login))
                stringBuilder.AppendLine("Введите логин");
            if (comboEmployee.SelectedItem == null)
                stringBuilder.AppendLine("Выберите сотрудника");
            else
                currentUser.EmployeeId = comboData.FirstOrDefault(p => p.Value == comboEmployee.SelectedItem.ToString()).Key;
            if(stringBuilder.Length != 0)
            {
                MessageBox.Show(stringBuilder.ToString(), "Информация", MessageBoxButton.OK, MessageBoxImage.Information);
                return;
            }
            try
            {
                bool isNewAccount = false;
                if (String.IsNullOrEmpty(currentUser.Password))
                {
                    currentUser.Password = PasswordEncryption.PasswordEncryption.createMD5("123456");
                    isNewAccount = true;
                    MedicalLaboratoryEntities.getContext().User.Add(currentUser);
                }
                MedicalLaboratoryEntities.getContext().SaveChanges();
                if (isNewAccount)
                    MessageBox.Show("Данные сохранены. Пароль по умолчанию - 123456", "Информация", MessageBoxButton.OK, MessageBoxImage.Information);
                else
                    MessageBox.Show("Данные сохранены", "Информация", MessageBoxButton.OK, MessageBoxImage.Information);
                parrentPage.Visibility = Visibility.Collapsed;
                parrentPage.Visibility = Visibility.Visible;
                this.Close();
                
            }
            catch
            {
                MessageBox.Show("Ошибка соединения с базой", "Ошибка", MessageBoxButton.OK, MessageBoxImage.Error);
            }
        }
    }
}
