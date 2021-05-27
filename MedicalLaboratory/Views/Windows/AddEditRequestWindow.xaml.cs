using MedicalLaboratory.Data.BaseModel;
using MedicalLaboratory.Properties;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Windows;
using System.Windows.Controls;

namespace MedicalLaboratory.Views.Windows
{
    /// <summary>
    /// Логика взаимодействия для AddEditRequestWindow.xaml
    /// </summary>
    public partial class AddEditRequestWindow : Window
    {
        private Page parrentPage;
        private Request currentRequest;
        private Dictionary<int, string> comboData = new Dictionary<int, string>();
        private Dictionary<int, string> listData = new Dictionary<int, string>();
        public AddEditRequestWindow(Request request, Page page)
        {
            InitializeComponent();
            parrentPage = page;
            this.Title = "Добавление заявки";
            currentRequest = new Request();
            try
            {
                foreach (var row in MedicalLaboratoryEntities.getContext().Client.ToList())
                {
                    comboData.Add(row.Id, row.LastName + " " + row.FirstName.First() + ". " + (!String.IsNullOrWhiteSpace(row.Patronymic)? row.Patronymic.First() + "." : ""));
                }
                comboClient.ItemsSource = comboData.Values;

                foreach (var row in MedicalLaboratoryEntities.getContext().Service.ToList())
                {
                    listData.Add(row.Id, row.Title + " - " + Convert.ToDouble(row.Cost) + " руб");
                }
                listServices.ItemsSource = listData.Values;
            }
            catch
            {
                MessageBox.Show("Ошибка получения данных", "Ошибка", MessageBoxButton.OK, MessageBoxImage.Error);
            }
            if (request != null)
            {
                currentRequest = request;
                this.Title = "Редактирование заявки";
                string value = "";
                if (comboData.TryGetValue(currentRequest.ClientId, out value))
                {
                    comboClient.SelectedItem = value;
                }
                try
                {
                    foreach (var row in MedicalLaboratoryEntities.getContext().RequestServices.ToList())
                    {
                        if(currentRequest.Id == row.RequestId)
                        {
                            if (listData.TryGetValue(row.ServiceId, out value))
                            {
                                listServices.SelectedItems.Add(value);
                            }
                        }  
                    }
                }
                catch
                {
                    MessageBox.Show("Ошибка получения данных", "Ошибка", MessageBoxButton.OK, MessageBoxImage.Error);
                }
            }
            DataContext = currentRequest;
        }

        private void btnAddClient_Click(object sender, RoutedEventArgs e)
        {
            AddEditClientWindow addEditClientWindow = new AddEditClientWindow(null, null);
            addEditClientWindow.Owner = this;
            addEditClientWindow.ShowDialog();
            try
            {
                comboData.Clear();
                MedicalLaboratoryEntities.getContext().ChangeTracker.Entries().ToList().ForEach(p => p.Reload());
                foreach (var row in MedicalLaboratoryEntities.getContext().Client.ToList())
                {
                    comboData.Add(row.Id, row.LastName + " " + row.FirstName.First() + ". " + (!String.IsNullOrWhiteSpace(row.Patronymic) ? row.Patronymic.First() + "." : ""));
                }
                comboClient.ItemsSource = null;
                comboClient.ItemsSource = comboData.Values;
                comboClient.SelectedItem = comboData.Values.Last();
            }
            catch
            {
                MessageBox.Show("Ошибка получения данных", "Ошибка", MessageBoxButton.OK, MessageBoxImage.Error);
            }
        }

        private void btnSave_Click(object sender, RoutedEventArgs e)
        {
            StringBuilder stringBuilder = new StringBuilder();
            if (comboClient.SelectedItem == null)
                stringBuilder.AppendLine("Выберите клиента");
            if(listServices.SelectedItems.Count == 0)
                stringBuilder.AppendLine("Выберите услуги");
            if (stringBuilder.Length != 0)
            {
                MessageBox.Show(stringBuilder.ToString(), "Информация", MessageBoxButton.OK, MessageBoxImage.Information);
                return;
            }
            try
            {
                currentRequest.ClientId = comboData.FirstOrDefault(p => p.Value == comboClient.SelectedItem.ToString()).Key;
                if (currentRequest.Id != 0)
                {
                    for (int i = 0; i < listServices.SelectedItems.Count; i++)
                    {
                        var requestService = new RequestServices();
                        requestService.RequestId = currentRequest.Id;
                        requestService.ServiceId = listData.FirstOrDefault(p => p.Value == listServices.SelectedItems[i].ToString()).Key;
                        int count = 0;
                        foreach (var row in currentRequest.RequestServices.ToList())
                        {
                            if (row.RequestId == requestService.RequestId && row.ServiceId == requestService.ServiceId)
                            {
                                count = 0;
                                break;
                            }
                            else
                                count++;
                        }
                        if (count == currentRequest.RequestServices.Count())
                            currentRequest.RequestServices.Add(requestService);
                    }
                    foreach (var row in currentRequest.RequestServices.ToList())
                    {
                        var requestService = new RequestServices();
                        int count = 0;
                        for (int i = 0; i < listServices.SelectedItems.Count; i++)
                        {
                            requestService.RequestId = currentRequest.Id;
                            requestService.ServiceId = listData.FirstOrDefault(p => p.Value == listServices.SelectedItems[i].ToString()).Key;
                            if (row.RequestId == requestService.RequestId && row.ServiceId == requestService.ServiceId)
                            {
                                count = 0;
                                break;
                            }
                            else
                                count++;
                        }
                        if (count == listServices.SelectedItems.Count)
                            MedicalLaboratoryEntities.getContext().Database.ExecuteSqlCommand("DELETE FROM RequestServices WHERE Id = " + row.Id);
                    }
                }
                else
                {
                    currentRequest.DateOfCreation = DateTime.Now;
                    currentRequest.UserId = Settings.Default.userId;
                    MedicalLaboratoryEntities.getContext().Request.Add(currentRequest);
                }
                MedicalLaboratoryEntities.getContext().SaveChanges();
                MessageBox.Show("Данные сохранены", "Информация", MessageBoxButton.OK, MessageBoxImage.Information);
                parrentPage.Visibility = Visibility.Collapsed;
                parrentPage.Visibility = Visibility.Visible;
                this.Close();
            }
            catch
            {
                MessageBox.Show("Ошибка соединения с базой", "Ошибка", MessageBoxButton.OK, MessageBoxImage.Error);
            }
        }
    }
}
