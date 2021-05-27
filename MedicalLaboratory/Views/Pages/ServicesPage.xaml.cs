using MedicalLaboratory.Data.BaseModel;
using MedicalLaboratory.Views.Windows;
using System.Linq;
using System.Windows;
using System.Windows.Controls;

namespace MedicalLaboratory.Views.Pages
{
    /// <summary>
    /// Логика взаимодействия для ServicesPage.xaml
    /// </summary>
    public partial class ServicesPage : Page
    {
        public ServicesPage()
        {
            InitializeComponent();
        }

        private void btnEdit_Click(object sender, RoutedEventArgs e)
        {
            AddEditServicesWindow addEditServicesWindow = new AddEditServicesWindow((sender as Button).DataContext as Service, this);
            addEditServicesWindow.ShowDialog();
        }

        private void btnAdd_Click(object sender, RoutedEventArgs e)
        {
            AddEditServicesWindow addEditServicesWindow = new AddEditServicesWindow(null, this);
            addEditServicesWindow.ShowDialog();
        }

        private void btnDelete_Click(object sender, RoutedEventArgs e)
        {
            var services = dGridServices.SelectedItems.Cast<Service>().ToList();
            if (services.Count != 0)
            {
                if (MessageBox.Show($"Вы точно хотите удалить следующие {services.Count()} элементов?", "Информация", MessageBoxButton.YesNo, MessageBoxImage.Information) == MessageBoxResult.Yes)
                {
                    try
                    {
                        MedicalLaboratoryEntities.getContext().Service.RemoveRange(services);
                        MedicalLaboratoryEntities.getContext().SaveChanges();
                        MessageBox.Show("Данные удалены!", "Информация", MessageBoxButton.OK, MessageBoxImage.Information);
                        dGridServices.ItemsSource = MedicalLaboratoryEntities.getContext().Service.ToList();
                    }
                    catch
                    {
                        MessageBox.Show("Ошибка в удалении данных", "Ошибка", MessageBoxButton.OK, MessageBoxImage.Error);
                    }
                }
            }
            else
            {
                MessageBox.Show("Выберите элемент", "Информация", MessageBoxButton.OK, MessageBoxImage.Information);
            }
        }

        private void Page_IsVisibleChanged(object sender, DependencyPropertyChangedEventArgs e)
        {
            try
            {
                dGridServices.ItemsSource = MedicalLaboratoryEntities.getContext().Service.ToList();
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
                    (window as BaseWindow).Title = "Услуги";
                }
            }
        }

        private void txtBoxSearch_TextChanged(object sender, TextChangedEventArgs e)
        {
            if (!string.IsNullOrEmpty(txtBoxSearch.Text))
            {
                try
                {
                    dGridServices.ItemsSource = MedicalLaboratoryEntities.getContext().Service.Where(p => p.Title.ToString().ToLower().Contains(txtBoxSearch.Text.ToLower()) ||
                         p.Cost.ToString().ToLower().Contains(txtBoxSearch.Text.ToLower()) || p.Description.ToString().ToLower().Contains(txtBoxSearch.Text.ToLower())).ToList();
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
                    dGridServices.ItemsSource = MedicalLaboratoryEntities.getContext().Service.ToList();
                }
                catch
                {
                    MessageBox.Show("Ошибка в получении данных", "Ошибка", MessageBoxButton.OK, MessageBoxImage.Error);
                }
            }
        }
    }
}
