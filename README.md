# Auto Layout exercice

- The goal is to create an adaptative table view using only auto layout. In IB or programmatically
- each cell should have a variable row height (UITableViewAutomaticDimension)

# AC
1. Image should be 1/3 of the cell width and start on the left edge
2. image ratio is 3/4
3. title , date of creation or artist should never clip. They can be more than 1 line if needed
4. title top is align with thumbnail image top. Creation date is below title, Artist is below creation date
5. description is at least 10 point below thumb image or artist name whichever is lower
6. No ellipsis on iphone 5 up to iPad
7. layout remain as the device flip

