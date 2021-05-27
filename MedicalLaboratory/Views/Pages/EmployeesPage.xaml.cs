using MedicalLaboratory.Data.BaseModel;
using MedicalLaboratory.Views.Windows;
using System.Linq;
using System.Windows;
using System.Windows.Controls;

namespace MedicalLaboratory.Views.Pages
{
    /// <summary>
    /// Логика взаимодействия для EmployeesPage.xaml
    /// </summary>
    public partial class EmployeesPage : Page
    {
        public EmployeesPage()
        {
            InitializeComponent();
        }

        private void btnEdit_Click(object sender, RoutedEventArgs e)
        {
            AddEditEmployeeWindow addEditEmployeeWindow = new AddEditEmployeeWindow((sender as Button).DataContext as Employee, this);
            addEditEmployeeWindow.ShowDialog();
        }

        private void btnAdd_Click(object sender, RoutedEventArgs e)
        {
            AddEditEmployeeWindow addEditEmployeeWindow = new AddEditEmployeeWindow(null, this);
            addEditEmployeeWindow.ShowDialog();
        }

        private void btnDelete_Click(object sender, RoutedEventArgs e)
        {
            var employee = dGridEmployees.SelectedItems.Cast<Employee>().ToList();
            if (employee.Count != 0)
            {
                if (MessageBox.Show($"Вы точно хотите удалить следующие {employee.Count()} элементов?", "Информация", MessageBoxButton.YesNo, MessageBoxImage.Information) == MessageBoxResult.Yes)
                {
                    try
                    {
                        MedicalLaboratoryEntities.getContext().Employee.RemoveRange(employee);
                        MedicalLaboratoryEntities.getContext().SaveChanges();
                        MessageBox.Show("Данные удалены!", "Информация", MessageBoxButton.OK, MessageBoxImage.Information);
                        dGridEmployees.ItemsSource = MedicalLaboratoryEntities.getContext().Employee.ToList();
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
                dGridEmployees.ItemsSource = MedicalLaboratoryEntities.getContext().Employee.ToList();
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
                    (window as BaseWindow).Title = "Сотрудники";
                }
            }
        }

        private void txtBoxSearch_TextChanged(object sender, TextChangedEventArgs e)
        {
            if (!string.IsNullOrEmpty(txtBoxSearch.Text))
            {
                try
                {
                    dGridEmployees.ItemsSource = MedicalLaboratoryEntities.getContext().Employee.Where(p => p.FirstName.ToString().ToLower().Contains(txtBoxSearch.Text.ToLower()) ||
                         p.LastName.ToString().ToLower().Contains(txtBoxSearch.Text.ToLower()) || p.Patronymic.ToString().ToLower().Contains(txtBoxSearch.Text.ToLower()) || p.Email.ToString().ToLower().Contains(txtBoxSearch.Text.ToLower())).ToList();
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
                    dGridEmployees.ItemsSource = MedicalLaboratoryEntities.getContext().Employee.ToList();
                }
                catch
                {
                    MessageBox.Show("Ошибка в получении данных", "Ошибка", MessageBoxButton.OK, MessageBoxImage.Error);
                }
            }
        }
    }
}
