using MedicalLaboratory.Properties;
using MedicalLaboratory.Tools;
using MedicalLaboratory.Views.Pages;
using System;
using System.Linq;
using System.Threading.Tasks;
using System.Windows;
using System.Windows.Media.Imaging;

namespace MedicalLaboratory.Views.Windows
{
    /// <summary>
    /// Логика взаимодействия для BaseWindow.xaml
    /// </summary>
    public partial class BaseWindow : Window
    {
        private bool logoImageClick = false;
        public BaseWindow()
        {
            InitializeComponent();
            if (Settings.Default.userPost.Equals("Администратор"))
            {
                imageProfile.ImageSource = new BitmapImage(new Uri("pack://application:,,,/Resources/PostImages/admin.png", UriKind.Absolute));
            }
            else if (Settings.Default.userPost.Equals("Менеджер"))
            {
                imageProfile.ImageSource = new BitmapImage(new Uri("pack://application:,,,/Resources/PostImages/manager.png", UriKind.Absolute));
            }
            else if (Settings.Default.userPost.Equals("Бухгалтер"))
            {
                imageProfile.ImageSource = new BitmapImage(new Uri("pack://application:,,,/Resources/PostImages/accountant.png", UriKind.Absolute));
            }
            Manager.managerFrame = frame;
            Manager.managerFrame.Navigate(new MenuPage());
            loginProfile.Text = Settings.Default.userLogin;
            userInfo.Text = Settings.Default.userLastName + " " + Settings.Default.userFirstName.First() + ". " + Settings.Default.userPatronymic.First() + ".";
            userPhone.Text = Settings.Default.userPhone;
            userEmail.Text = Settings.Default.userEmail;
            if (Settings.Default.userPassword.Equals("123456"))
            {
                if (MessageBox.Show("Ради Вашей безопасности необходимо сменить пароль", "Информация", MessageBoxButton.YesNo, MessageBoxImage.Information) == MessageBoxResult.Yes)
                    Manager.managerFrame.Navigate(new EditAccountPage());
            }

        }

        private void btnExit_Click(object sender, RoutedEventArgs e)
        {
            AuthWindow authWindow = new AuthWindow();
            authWindow.Show();
            this.Close();
        }

        private void frame_ContentRendered(object sender, EventArgs e)
        {
            if (Manager.managerFrame.CanGoBack)
            {
                btnBack.Visibility = Visibility.Visible;
            }
            else
            {
                btnBack.Visibility = Visibility.Collapsed;
            }
        }

        private void btnMenu_Click(object sender, RoutedEventArgs e)
        {
            Manager.managerFrame.Navigate(new MenuPage());
        }

        private void btnBack_Click(object sender, RoutedEventArgs e)
        {
            Manager.managerFrame.GoBack();
        }

        private void editUserInfo_Click(object sender, RoutedEventArgs e)
        {
            Manager.managerFrame.Navigate(new EditAccountPage());
        }

        private void logoImage_Click(object sender, RoutedEventArgs e)
        {
            startTimerAsync(5);
        }

        async void startTimerAsync(int seconds)
        {
            var time = DateTime.Now + TimeSpan.FromSeconds(seconds);
            while (DateTime.Now < time)
            {
                if (!logoImageClick)
                {
                    logo.Source = new BitmapImage(new Uri("/Resources/Logos/logo_red.ico", UriKind.Relative));
                    logoImageClick = true;
                    this.Icon = new BitmapImage(new Uri("pack://application:,,,/Resources/Logos/logo_red.ico", UriKind.Absolute));
                }
                else
                {
                    logo.Source = new BitmapImage(new Uri("/Resources/Logos/logo_blue.ico", UriKind.Relative));
                    logoImageClick = false;
                    this.Icon = new BitmapImage(new Uri("pack://application:,,,/Resources/Logos/logo_blue.ico", UriKind.Absolute));
                }
                await Task.Delay(TimeSpan.FromSeconds(0.11));
            }
        }

    }
}
