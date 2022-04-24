//
//  PreviousDayPresenter.swift
//  Garden_App
//
//  Created by Alina Bikkinina on 24.04.2022.
//

import Foundation

class PreviousDayPresenter {
    weak var dayView: PreviousDayViewController?
    
    func initialize() {
        dayView?.dateLabel.text = "Март, 3"
        dayView?.adviceView.text = "Продолжайте работы предыдущего дня. В саду скиньте мокрый, тыжелый снег с ветвей и теплицы, начните подготовку сада к сезону."
        dayView?.noteView.text = "Нашла новое приложение для садоводства. Скачала его, сейчас пишу в нем первую заметку. Не знаю откуда они берут эти советы, я к своему саду проехать до сих пор не могу - на дороге снег и грязь. Это можно скрыть?"
    }
}
