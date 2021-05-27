using MedicalLaboratory.Data.BaseModel;
using MedicalLaboratory.Views.Windows;
using System.Linq;
using System.Windows;
using System.Windows.Controls;

namespace MedicalLaboratory.Views.Pages
{
    /// <summary>
    /// Логика взаимодействия для AnalyzesPage.xaml
    /// </summary>
    public partial class AnalyzesPage : Page
    {
        public AnalyzesPage()
        {
            InitializeComponent();
        }

        private void Page_IsVisibleChanged(object sender, DependencyPropertyChangedEventArgs e)
        {
            try
            {
                dGridAnalyzes.ItemsSource = MedicalLaboratoryEntities.getContext().Analyzes.ToList();
            }
            catch
            {
                MessageBox.Show("Ошибка в получении данных", "Ошибка", MessageBoxButton.OK, MessageBoxImage.Error);
            }
        }

        private void Page_Loaded(object sender, RoutedEventArgs e)
        {
            foreach (Window window in Application.Current.Windows)
            {
                if (window.GetType() == typeof(BaseWindow))
                {
                    (window as BaseWindow).Title = "Результаты анализов";
                }
            }
        }

        private void txtBoxSearch_TextChanged(object sender, TextChangedEventArgs e)
        {
            if (!string.IsNullOrEmpty(txtBoxSearch.Text))
            {
                try
                {
                    dGridAnalyzes.ItemsSource = MedicalLaboratoryEntities.getContext().Analyzes.Where(p => p.RequestServicesId.ToString().ToLower().Contains(txtBoxSearch.Text.ToLower()) ||
                         p.Result.ToString().ToLower().Contains(txtBoxSearch.Text.ToLower()) || p.DateCompletion.ToString().ToLower().Contains(txtBoxSearch.Text.ToLower())).ToList();
                }
                catch
                {
                    MessageBox.Show("Ошибка в получении данных", "Ошибка", MessageBoxButton.OK, MessageBoxImage.Error);
                }
            }
            else
            {
                try
                {
                    dGridAnalyzes.ItemsSource = MedicalLaboratoryEntities.getContext().Analyzes.ToList();
                }
                catch
                {
                    MessageBox.Show("Ошибка в получении данных", "Ошибка", MessageBoxButton.OK, MessageBoxImage.Error);
                }
            }
            
        }
    }
}
