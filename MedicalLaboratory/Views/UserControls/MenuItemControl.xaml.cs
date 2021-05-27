using MedicalLaboratory.Tools;
using MedicalLaboratory.Views.Pages;
using System.Windows;
using System.Windows.Controls;
using System.Windows.Media;
using System.Windows.Media.Imaging;

namespace MedicalLaboratory.Views
{
    /// <summary>
    /// Логика взаимодействия для MenuItemControl.xaml
    /// </summary>
    public partial class MenuItemControl : UserControl
    {
        public string header { get; set; }
        public ImageSource coloredSource { get; set; }
        public ImageSource blackWhiteSource => coloredSource == null ? null : new FormatConvertedBitmap((BitmapSource)coloredSource, PixelFormats.Gray8, null, 0);
        public MenuItemControl()
        {
            InitializeComponent();
            DataContext = this;
        }

        private void userControl_Click(object sender, RoutedEventArgs e)
        {
            if (header.Equals("Пользователи"))
                Manager.managerFrame.Navigate(new UsersPage());
            else if (header.Equals("История"))
                Manager.managerFrame.Navigate(new HistoryPage());
            else if(header.Equals("Услуги"))
                Manager.managerFrame.Navigate(new ServicesPage());
            else if(header.Equals("Клиенты"))
                Manager.managerFrame.Navigate(new ClientsPage());
            else if (header.Equals("Сотрудники"))
                Manager.managerFrame.Navigate(new EmployeesPage());
            else if(header.Equals("Заявки"))
                Manager.managerFrame.Navigate(new RequestPage());
            else if (header.Equals("Отчетность"))
                Manager.managerFrame.Navigate(new ReportPage());
            else if (header.Equals("Результаты анализов"))
                Manager.managerFrame.Navigate(new AnalyzesPage());
        }
    }
}
