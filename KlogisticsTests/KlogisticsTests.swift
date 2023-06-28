//
//  KlogisticsTests.swift
//  KlogisticsTests
//
//  Created by Иван on 28.06.2023.
//

import XCTest
@testable import Klogistics

final class KlogisticsTests: XCTestCase {

    var onboardingModel = OnboardingModel(rootModel: RootModel())
    
    //  Порядок извлечения
    func testQueueSequence() {
        
        let firstEqual = onboardingModel.queue.first?.image == "b1" && onboardingModel.queue.first?.title == "Quick Delivery At Your Doorstep" && onboardingModel.queue.first?.descr == "Enjoy quick pick-up and delivery to your destination"
        
        onboardingModel.next()
        
        let secondEqual = onboardingModel.queue.first?.image == "b2" && onboardingModel.queue.first?.title == "Flexible Payment" && onboardingModel.queue.first?.descr == "Different modes of payment either before and after delivery without stress"
        
        onboardingModel.next()
        
        let thirdEqual = onboardingModel.queue.first?.image == "b3" && onboardingModel.queue.first?.title == "Real-time Tracking" && onboardingModel.queue.first?.descr == "Track your packages/items from the comfort of your home till final destination"
        
        let finalAssert = firstEqual && secondEqual && thirdEqual
        XCTAssert(finalAssert)
    }
    
    
    //  Корректное извлечение
    func testCount() {
        let startCount = onboardingModel.queue.count
        onboardingModel.next()
        let currentCount = onboardingModel.queue.count
        
        let isCountDecremented = currentCount == (startCount - 1)
        XCTAssertTrue(isCountDecremented)
    }
    
    //  Кнопки, когда в очереди несколько изображений
    func testButtonsWithItems() {
        let assert = (onboardingModel.queue.count > 1) && (onboardingModel.isShowLogin == false)
        XCTAssertTrue(assert)
    }
    
    //  Кнопки и одно изображение: кнопки должны поменяться
    func testButtonsWithSingleItem() {
        onboardingModel.next()
        onboardingModel.next()
        
        let assert = (onboardingModel.queue.count == 1) && (onboardingModel.isShowLogin == true)
        XCTAssert(assert)
    }
    
    
    
    //  Переход, если очередь пустая
    func testMoveIfQueueEmpty() {
        onboardingModel.next()
        onboardingModel.next()
        onboardingModel.signUp()
        
        let assert = onboardingModel.rootModel.current == .signUp
        XCTAssert(assert)
    }
    
    //  Если не пустая, нет перехода
    func testMoveIfQueueNon_Empty() {
        onboardingModel.signUp()
        
        let assert = onboardingModel.rootModel.current == .signUp
        XCTAssert(assert)
    }
    
}
