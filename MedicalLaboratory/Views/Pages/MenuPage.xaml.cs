using MedicalLaboratory.Properties;
using MedicalLaboratory.Views.Windows;
using System.Windows;
using System.Windows.Controls;

namespace MedicalLaboratory.Views.Pages
{
    /// <summary>
    /// Логика взаимодействия для MenuPage.xaml
    /// </summary>
    public partial class MenuPage : Page
    {
        public MenuPage()
        {
            InitializeComponent();
            if (Settings.Default.userPost.Equals("Администратор"))
            {
                adminMenu.Visibility = Visibility.Visible;
                managerMenu.Visibility = Visibility.Collapsed;
                counterMenu.Visibility = Visibility.Collapsed;
            }
            else if (Settings.Default.userPost.Equals("Менеджер"))
            {
                adminMenu.Visibility = Visibility.Collapsed;
                managerMenu.Visibility = Visibility.Visible;
                counterMenu.Visibility = Visibility.Collapsed;
            }
            else if (Settings.Default.userPost.Equals("Бухгалтер"))
            {
                adminMenu.Visibility = Visibility.Collapsed;
                managerMenu.Visibility = Visibility.Collapsed;
                counterMenu.Visibility = Visibility.Visible;
            }
        }

        private void Page_IsVisibleChanged(object sender, DependencyPropertyChangedEventArgs e)
        {

        }
        private void Page_Loaded(object sender, RoutedEventArgs e)
        {
            foreach (Window window in Application.Current.Windows)
            {
                if (window.GetType() == typeof(BaseWindow))
                {
                    (window as BaseWindow).Title = "Главное меню";
                }
            }
        }
    }
}
