import Foundation

//Подгрузка данных в формате JSON нужной вакансии по нужной странице; декодирование

final class SampleData {
    static func generateJobsData(jobSearched: String, page: Int) -> [Job] {
        var outputData = [Job]()

        let jsonUrlStr = "https://jobs.github.com/positions.json?search=\(jobSearched)&page=\(page)"
        let semaphore = DispatchSemaphore(value: 0)
        
        guard let url = URL(string: jsonUrlStr) else {return outputData}
        URLSession.shared.dataTask(with: url) {(data, response, err) in
            guard let data = data else {return}
        
            do {
                let decoder = JSONDecoder()
                let jobs = try decoder.decode([Job].self, from: data)
//                for job in jobs {
//                    print(job)
//                }
                outputData = jobs
                semaphore.signal()
            } catch let jsonErr {
                print("Error serialized json \(jsonErr)")
            }
            }.resume()
        //Ожидаем, в противном случае их невозможно сохранить в переменной
        semaphore.wait()
        
        return outputData
    }
}
