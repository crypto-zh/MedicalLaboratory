using MedicalLaboratory.Data.BaseModel;
using MedicalLaboratory.Views.Windows;
using System.Linq;
using System.Windows;
using System.Windows.Controls;

namespace MedicalLaboratory.Views.Pages
{
    /// <summary>
    /// Логика взаимодействия для RequestPage.xaml
    /// </summary>
    public partial class RequestPage : Page
    {
        public RequestPage()
        {
            InitializeComponent();
        }

        private void Page_IsVisibleChanged(object sender, DependencyPropertyChangedEventArgs e)
        {
            try
            {
                MedicalLaboratoryEntities.getContext().ChangeTracker.Entries().ToList().ForEach(p => p.Reload());
                dGridRequest.ItemsSource = MedicalLaboratoryEntities.getContext().RequestWithServices.OrderByDescending(p=>p.DateOfCreation).ToList();                
            }
            catch
            {
                MessageBox.Show("Ошибка в получении данных", "Ошибка", MessageBoxButton.OK, MessageBoxImage.Error);
            }
        }

        private void btnDelete_Click(object sender, RoutedEventArgs e)
        {
            var requests = dGridRequest.SelectedItems.Cast<RequestWithServices>().ToList();
            if (requests.Count != 0)
            {
                if (MessageBox.Show($"Вы точно хотите удалить следующие {requests.Count()} элементов?", "Информация", MessageBoxButton.YesNo, MessageBoxImage.Information) == MessageBoxResult.Yes)
                {
                    try
                    {
                        foreach(var request in requests)
                        {
                            MedicalLaboratoryEntities.getContext().Database.ExecuteSqlCommand("DELETE FROM Request WHERE Id = " + request.Id);
                        }
                        MedicalLaboratoryEntities.getContext().SaveChanges();
                        MedicalLaboratoryEntities.getContext().ChangeTracker.Entries().ToList().ForEach(p => p.Reload());
                        MessageBox.Show("Данные удалены!", "Информация", MessageBoxButton.OK, MessageBoxImage.Information);
                        dGridRequest.ItemsSource = MedicalLaboratoryEntities.getContext().RequestWithServices.OrderByDescending(p => p.DateOfCreation).ToList();
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

        private void btnAdd_Click(object sender, RoutedEventArgs e)
        {
            AddEditRequestWindow addEditRequestWindow = new AddEditRequestWindow(null, this);
            addEditRequestWindow.ShowDialog();
        }

        private void btnEdit_Click(object sender, RoutedEventArgs e)
        {
            try
            {
                var currentRequest = (sender as Button).DataContext as RequestWithServices;
                AddEditRequestWindow addEditRequestWindow = new AddEditRequestWindow(MedicalLaboratoryEntities.getContext().Request.Where(p => p.Id == currentRequest.Id).FirstOrDefault(), this);
                addEditRequestWindow.ShowDialog();
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
                    (window as BaseWindow).Title = "Заявки";
                }
            }
        }

        private void txtBoxSearch_TextChanged(object sender, TextChangedEventArgs e)
        {
            if (!string.IsNullOrEmpty(txtBoxSearch.Text))
            {
                try
                {
                    dGridRequest.ItemsSource = MedicalLaboratoryEntities.getContext().RequestWithServices.Where(p => p.ClientInfo.ToString().ToLower().Contains(txtBoxSearch.Text.ToLower()) ||
                         p.DateOfCreation.ToString().ToLower().Contains(txtBoxSearch.Text.ToLower()) || p.Services.ToString().ToLower().Contains(txtBoxSearch.Text.ToLower()) || p.UserInfo.ToString().ToLower().Contains(txtBoxSearch.Text.ToLower()) || p.Id.ToString().ToLower().Contains(txtBoxSearch.Text.ToLower())).OrderByDescending(p => p.DateOfCreation).ToList();
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
                    dGridRequest.ItemsSource = MedicalLaboratoryEntities.getContext().RequestWithServices.ToList();
                }
                catch
                {
                    MessageBox.Show("Ошибка в получении данных", "Ошибка", MessageBoxButton.OK, MessageBoxImage.Error);
                }
            }
        }
    }
}
