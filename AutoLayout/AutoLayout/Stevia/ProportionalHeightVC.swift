import UIKit
import Stevia  //Sử dụng thư viện Stevia, một thư viện 3rd parties open source
class ProportionalHeightVC: UIViewController {
    let red_rect1 = UIView(frame: CGRect.zero)
    let red_rect2 = UIView(frame: CGRect.zero)
    let red_rect3 = UIView(frame: CGRect.zero)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor.white
        red_rect1.backgroundColor = UIColor.red
        red_rect2.backgroundColor = UIColor.green
        red_rect3.backgroundColor = UIColor.brown
        
        view.sv(
            red_rect1,
            red_rect2,
            red_rect3
        )  //sv là một method của UIView extesion được viết trong Stevia
        let margin: CGFloat = 10.0
        view.layout(
            |-(16)-red_rect1-(16)-|,
            margin,
            |-(16)-red_rect2-(16)-|,
            margin,
            |-(16)-red_rect3-(16)-|
        )
        red_rect1.Top == view.safeAreaLayoutGuide.Top + margin
        red_rect3.Bottom == view.safeAreaLayoutGuide.Bottom - margin
        red_rect1.Height == red_rect3.Height * 2.0
        red_rect2.Height == red_rect3.Height * 3.0
    }
    
    
}
