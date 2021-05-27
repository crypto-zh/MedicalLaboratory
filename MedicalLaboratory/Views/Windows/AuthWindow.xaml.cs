using MedicalLaboratory.Data.BaseModel;
using MedicalLaboratory.Properties;
using System;
using System.Linq;
using System.Windows;

namespace MedicalLaboratory.Views.Windows
{
    /// <summary>
    /// Логика взаимодействия для AuthWindow.xaml
    /// </summary>
    public partial class AuthWindow : Window
    {
        public AuthWindow()
        {
            InitializeComponent();
            if (!String.IsNullOrEmpty(Settings.Default.userLastName))
            {
                txtLogin.Text = Settings.Default.userLogin;
            }
        }
        private void btnEnter_Click(object sender, RoutedEventArgs e)
        {
            if (auth(txtLogin.Text, checkBoxPassword.IsChecked.Value ? txtBoxPassword.Text : txtPassword.Password))
            {
                BaseWindow baseWindow = new BaseWindow();
                baseWindow.Show();
                this.Close();
            }
            
        }

        private void checkBoxPassword_Click(object sender, RoutedEventArgs e)
        {
            if (checkBoxPassword.IsChecked.Value)
            {
                txtBoxPassword.Text = txtPassword.Password;
                txtBoxPassword.Visibility = Visibility.Visible;
                txtPassword.Visibility = Visibility.Collapsed;
            }
            else
            {
                txtPassword.Password = txtBoxPassword.Text;
                txtBoxPassword.Visibility = Visibility.Collapsed;
                txtPassword.Visibility = Visibility.Visible;
            }
        }
        private bool auth(String login, String password)
        {
            try
            {
                password = PasswordEncryption.PasswordEncryption.createMD5(password);
                var resultWithLogin = MedicalLaboratoryEntities.getContext().User.Where(p => p.Login == login).FirstOrDefault();
                if(resultWithLogin != null)
                {
                    var result = MedicalLaboratoryEntities.getContext().User.Where(p => p.Login == login && p.Password == password).FirstOrDefault();
                    if (result != null)
                    {
                        MessageBox.Show("Вы успешно авторизованы", "Информация", MessageBoxButton.OK, MessageBoxImage.Information);
                        Settings.Default.userLogin = result.Login;
                        Settings.Default.userPassword = result.Password;
                        Settings.Default.userLastName = result.Employee.LastName;
                        Settings.Default.userFirstName = result.Employee.FirstName;
                        Settings.Default.userPatronymic = result.Employee.Patronymic;
                        Settings.Default.userPhone = result.Employee.Phone;
                        Settings.Default.userEmail = result.Employee.Email;
                        Settings.Default.userId = result.Employee.Id;
                        Settings.Default.userPost = result.Employee.Post.Title;
                        addHistoryEntry(result.Id, true);
                        return true;
                    }
                    else
                    {
                        MessageBox.Show("Вы неверно ввели логин или пароль", "Информация", MessageBoxButton.OK, MessageBoxImage.Information);
                        addHistoryEntry(resultWithLogin.Id, false);
                    }
                }
                else
                {
                    MessageBox.Show("Вы неверно ввели логин или пароль", "Информация", MessageBoxButton.OK, MessageBoxImage.Information);
                }
            }
            catch
            {
                MessageBox.Show("Ошибка соединения с базой данных", "Ошибка", MessageBoxButton.OK, MessageBoxImage.Error);
            }
            return false;
        }
        private void addHistoryEntry(int userId, bool result)
        {
            try
            {
                AuthorizationHistory historyEnter = new AuthorizationHistory();
                historyEnter.UserId = userId;
                historyEnter.Date = DateTime.Now;
                historyEnter.Successfully = result;
                MedicalLaboratoryEntities.getContext().AuthorizationHistory.Add(historyEnter);
                MedicalLaboratoryEntities.getContext().SaveChanges();
            }
            catch
            {
                MessageBox.Show("Ошибка соединения с базой данных", "Ошибка", MessageBoxButton.OK, MessageBoxImage.Error);
            }
        }
    }
}
