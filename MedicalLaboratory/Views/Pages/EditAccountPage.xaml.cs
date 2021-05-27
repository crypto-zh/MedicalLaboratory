using MedicalLaboratory.Data.BaseModel;
using MedicalLaboratory.Properties;
using MedicalLaboratory.Tools;
using MedicalLaboratory.Views.Windows;
using System;
using System.Linq;
using System.Text;
using System.Windows;
using System.Windows.Controls;

namespace MedicalLaboratory.Views.Pages
{
    /// <summary>
    /// Логика взаимодействия для EditAccountPage.xaml
    /// </summary>
    public partial class EditAccountPage : Page
    {
        public EditAccountPage()
        {
            InitializeComponent();
            txtLastName.Text = Settings.Default.userLastName;
            txtFirstName.Text = Settings.Default.userFirstName;
            txtPatronymic.Text = Settings.Default.userPatronymic;
            txtPhone.Text = Settings.Default.userPhone;
            txtEmail.Text = Settings.Default.userEmail;
            txtLogin.Text = Settings.Default.userLogin;
        }

        private void btnSave_Click(object sender, RoutedEventArgs e)
        {
            StringBuilder stringBuilder = new StringBuilder();
            if (String.IsNullOrEmpty(txtFirstName.Text))
                stringBuilder.AppendLine("Введите имя");
            if (String.IsNullOrEmpty(txtLastName.Text))
                stringBuilder.AppendLine("Введите фамилию");
            if (String.IsNullOrEmpty(txtLogin.Text))
                stringBuilder.AppendLine("Введите логин");
            if (String.IsNullOrEmpty(txtPhone.Text))
                stringBuilder.AppendLine("Введите телефон");
            if (String.IsNullOrEmpty(txtEmail.Text))
                stringBuilder.AppendLine("Введите почту");
            if(!String.IsNullOrEmpty(passNew.Password) && passNew.Password.Length < 6)
                stringBuilder.AppendLine("Пароль должен быть не менее 6 символов");
            if(!String.IsNullOrEmpty(passNew.Password) && passNew.Password != passNewConfirm.Password)
                stringBuilder.AppendLine("Пароли не совпарадают");
            if (stringBuilder.Length != 0)
            {
                MessageBox.Show(stringBuilder.ToString(), "Внимание", MessageBoxButton.OK, MessageBoxImage.Information);
                return;
            }
            try
            {
                User user = MedicalLaboratoryEntities.getContext().User.Where(p => p.EmployeeId == Settings.Default.userId).Single<User>();
                user.Login = txtLogin.Text;
                if (!String.IsNullOrEmpty(passNew.Password))
                    user.Password = PasswordEncryption.PasswordEncryption.createMD5(passNew.Password);
                Employee employee = MedicalLaboratoryEntities.getContext().Employee.Where(p => p.Id == Settings.Default.userId).Single<Employee>();
                employee.LastName = txtLastName.Text;
                employee.FirstName = txtFirstName.Text;
                employee.Patronymic = txtPatronymic.Text;
                employee.Phone = txtPhone.Text;
                employee.Email = txtEmail.Text;
                MedicalLaboratoryEntities.getContext().SaveChanges();
                MessageBox.Show("Данные успешно сохранены", "Внимание", MessageBoxButton.OK, MessageBoxImage.Information);
                Settings.Default.userLogin = txtLogin.Text;
                Settings.Default.userLastName = txtLastName.Text ;
                Settings.Default.userFirstName=txtFirstName.Text;
                Settings.Default.userPatronymic = txtPatronymic.Text;
                Settings.Default.userPhone = txtPhone.Text;
                Settings.Default.userEmail = txtEmail.Text;
                foreach (Window window in Application.Current.Windows)
                {
                    if (window.GetType() == typeof(BaseWindow))
                    {
                        (window as BaseWindow).userInfo.Text = Settings.Default.userLastName + " " + Settings.Default.userFirstName.First() + ". " + Settings.Default.userPatronymic.First() + ".";
                        (window as BaseWindow).loginProfile.Text = Settings.Default.userLogin;
                        (window as BaseWindow).userPhone.Text = Settings.Default.userPhone;
                        (window as BaseWindow).userEmail.Text = Settings.Default.userEmail;
                    }
                }
                Manager.managerFrame.GoBack();
            }
            catch
            {
                MessageBox.Show("Ошибка соединения с базой данных", "Ошибка", MessageBoxButton.OK, MessageBoxImage.Error);
            }
        }

        private void Page_Loaded(object sender, RoutedEventArgs e)
        {
            foreach (Window window in Application.Current.Windows)
            {
                if (window.GetType() == typeof(BaseWindow))
                {
                    (window as BaseWindow).Title = "Редактирование профиля";
                }
            }
        }
    }
}
