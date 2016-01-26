#include <cstdlib>
#include <iostream>
#include <opencv2/opencv.hpp>

int main(int argc, char *argv[])
{
    cv::Mat rgb = cv::imread("in.png");
    if (!rgb.data)
    {
        std::cerr << "No rgb data!" << "\n";
        return EXIT_FAILURE;
    }

    cv::Mat gray;
    cv::cvtColor(rgb, gray, CV_BGR2GRAY);
    cv::imwrite("grayscale.png", gray);

    cv::Mat gauss = gray.clone();
    cv::GaussianBlur(gray, gauss, cv::Size(3, 3), 0, 0);
    cv::imwrite("gauss.png", gauss);

    cv::Mat sobel = gauss.clone();
    cv::Mat sobelx = gauss.clone();
    cv::Mat sobely = gauss.clone();
    cv::Sobel(gauss, sobelx, -1, 1, 0);
    cv::Sobel(gauss, sobely, -1, 0, 1);
    cv::add(sobelx, sobely, sobel);
    cv::imwrite("sobel.png", sobel);

    return EXIT_SUCCESS;
}
