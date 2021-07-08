class FollowToggle {
    constructor(el) {
        this.$el = $(el);
        this.userId = this.$el.data('user-id')
        this.followState = this.$el.data('initial-follow-state')
        this.render()

    }
    render() {
        if (this.followState === 'unfollowed') {
            return 'Follow!'
        } else if (this.followState === 'followed'){
            return 'Unfollow!'
        }
    }

    handleClick(click) {
        click.preventDefault();

        
    }
}

module.exports = FollowToggle;