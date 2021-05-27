using MedicalLaboratory.Data.BaseModel;
using MedicalLaboratory.Views.Windows;
using System.Linq;
using System.Windows;
using System.Windows.Controls;

namespace MedicalLaboratory.Views.Pages
{
    /// <summary>
    /// Логика взаимодействия для UsersPage.xaml
    /// </summary>
    public partial class UsersPage : Page
    {
        public UsersPage()
        {
            InitializeComponent();
        }

        private void btnAdd_Click(object sender, RoutedEventArgs e)
        {
            AddEditUserWindow addEditUserWindow = new AddEditUserWindow(null, this);
            addEditUserWindow.ShowDialog();
        }

        private void btnDelete_Click(object sender, RoutedEventArgs e)
        {
            var users = dGridUsers.SelectedItems.Cast<User>().ToList();
            if (users.Count != 0)
            {
                if (MessageBox.Show($"Вы точно хотите удалить следующие {users.Count()} элементов?", "Информация", MessageBoxButton.YesNo, MessageBoxImage.Information) == MessageBoxResult.Yes)
                {
                    try
                    {
                        MedicalLaboratoryEntities.getContext().User.RemoveRange(users);
                        MedicalLaboratoryEntities.getContext().SaveChanges();
                        MessageBox.Show("Данные удалены!", "Информация", MessageBoxButton.OK, MessageBoxImage.Information);
                        dGridUsers.ItemsSource = MedicalLaboratoryEntities.getContext().User.ToList();
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
                dGridUsers.ItemsSource = MedicalLaboratoryEntities.getContext().User.ToList();
            }
            catch
            {
                MessageBox.Show("Ошибка в получении данных", "Ошибка", MessageBoxButton.OK, MessageBoxImage.Error);
            }
        }

        private void btnEdit_Click(object sender, RoutedEventArgs e)
        {
            AddEditUserWindow addEditUserWindow = new AddEditUserWindow((sender as Button).DataContext as User, this);
            addEditUserWindow.ShowDialog();
        }

        private void Page_Loaded(object sender, RoutedEventArgs e)
        {
            foreach (Window window in Application.Current.Windows)
            {
                if (window.GetType() == typeof(BaseWindow))
                {
                    (window as BaseWindow).Title = "Пользователи";
                }
            }
        }

        private void txtBoxSearch_TextChanged(object sender, TextChangedEventArgs e)
        {
            if (!string.IsNullOrEmpty(txtBoxSearch.Text))
            {
                try
                {
                    dGridUsers.ItemsSource = MedicalLaboratoryEntities.getContext().User.Where(p => p.Login.ToString().ToLower().Contains(txtBoxSearch.Text.ToLower()) ||
                        p.Employee.FirstName.ToString().ToLower().Contains(txtBoxSearch.Text.ToLower()) || p.Employee.LastName.ToString().ToLower().Contains(txtBoxSearch.Text.ToLower()) || p.Employee.Patronymic.ToString().ToLower().Contains(txtBoxSearch.Text.ToLower())).ToList();
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
                    dGridUsers.ItemsSource = MedicalLaboratoryEntities.getContext().User.ToList();
                }
                catch
                {
                    MessageBox.Show("Ошибка в получении данных", "Ошибка", MessageBoxButton.OK, MessageBoxImage.Error);
                }
            }
        }
    }
}
